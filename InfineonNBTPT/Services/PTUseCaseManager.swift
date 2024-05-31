// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation
import InfineonApdu

/// The `PTUseCaseManager` class serves as a manager for Pass-Through (PT) use case operations
/// supported by NBT device by providing the API specific to Pass-Through (PT) operations .
public class PTUseCaseManager {
    /// A property holder for the ``PTDemoCommandSet`` which provides the API supported by the
    /// NBT device application.
    ///
    /// - SeeAlso: ``PTDemoCommandSet``
    private var ptDemoCommandSet: PTDemoCommandSet

    /// Initializes a instance of the ``PTUseCaseManager`` class.
    ///
    /// - Parameters:
    ///  - ptDemoCommandSet: A ``PTDemoCommandSet`` object. it represents the command set to be used
    /// by
    /// the ``PTUseCaseManager`` instance to perform APDU communication.
    init(ptDemoCommandSet: PTDemoCommandSet) {
        self.ptDemoCommandSet = ptDemoCommandSet
    }

    /// Async method to connect to the NBT device.
    ///
    /// - Throws An ``APDUError``: if connecting to NBT fails.
    public func connect() async throws {
        _ = try await ptDemoCommandSet.connect(data: nil)
    }

    /// Method to disconnect from NFC device.
    ///
    /// - Throws Error if disconnecting from NFC device fails.
    public func disconnect() throws {
        try ptDemoCommandSet.disconnect()
    }

    /// Method to disconnect from NBT device.
    ///
    /// - Throws An ``APDUError``: if selecting NBT device application fails.
    public func selectApplication() async throws -> ApduResponse {
        try await ptDemoCommandSet.selectApplication()
    }

    /// Method to set the state of the LED (on or off)
    ///
    /// - Parameter state:  LED state on if true else off
    ///
    /// - Throws An ``APDUError`` if APDU communication with NBT device fails.
    public func setLED(state: Bool) async throws {
        // Demonstrator specific command
        _ = try await ptDemoCommandSet.setLedByPassthrough(state: state).checkOK()
    }
}
