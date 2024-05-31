// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import CoreNFC
import Foundation
import InfineonApdu

/// The ``PTViewModel`` class serves as a ViewModel providing the logic for pass through operations
/// related to the NBT device..  It conforms to the ``NFCSessionManager`` to effectively
/// manage NFC reader sessions for the purpose of pass through operation for NBT devices. It
/// can be also observed for changes using the ``ObservableObject`` protocol.
///
/// - SeeAlso: ``NFCSessionManager`` and ``ObservableObject``
class PTViewModel: NFCSessionManager {
    /// A published property that represents the LED status of a Pass-Through (PT) operation.
    /// It holds a boolean value indicating whether the LED has been set or not.
    ///
    /// - Remark: The ``isLEDOn`` property is marked with the ``@Published`` property wrapper,
    /// allowing it to automatically publish changes to any subscribers. When the value of
    /// ``isLEDOn`` changes, the associated views are updated accordingly.
    ///
    /// - Note: The initial value of ``isLEDOn`` is set to `nil` as status of LED is unknown.
    ///
    /// - SeeAlso: ``@Published``
    @Published public var isLEDOn: Bool?

    /// A Flag used to set LED state of NBT pass through demo application with basic operations
    /// defined in host.
    ///
    /// - Important: This property is set to false.
    public var ledStatus = false

    /// Asynchronous method responsible for managing communication with the NBT device. This method
    /// is invoked by the ``NFCSessionManager`` once the NFC device is detected, connected, and the
    /// NBT PT demo  applet is selected to perform Pass-Through (PT) operations.
    ///
    /// - Throws: ``AdpuError`` if there is any APDU communication error
    override func initiateNBTDeviceCommunication() async throws {
        // Update the user interface message as configuring LED.
        DispatchQueue.main.async {
            self.message = String(
                format: .messageConfiguringLEDState,
                self.ledStatus ? String.titleDisabled : String.titleEnabled
            )
            self.tagReaderSession?.alertMessage = self.message
        }
        // Perform the Pass-Through (PT) operations. If fails perform the Pass-Through (PT)
        // operations it throws the `AdpuError` or other Error
        _ = try await ptUseCaseManager!.setLED(state: ledStatus)

        // Update the user interface message as configured LED.
        DispatchQueue.main.async {
            self.isLEDOn = self.ledStatus
            self.message = String(
                format: .messageConfiguredLEDState,
                self.isLEDOn! ? String.titleEnabled : String.titleDisabled
            )
            self.tagReaderSession?.alertMessage = self.message
        }

        // Disconnect the NBT device
        try nbtPTCommandSet!.disconnect()
    }
}
