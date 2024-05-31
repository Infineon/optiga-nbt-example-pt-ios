// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view represent pass through read/write operation screen of mobile phone application
/// for the pass-through (PT) use case of the NBT.
struct PTModeView: View {
    /// An observed object representing the view model for ``PTModeView``.  This observed object
    /// property hold ViewModel responsible for Pass-Through (PT) operations.
    ///
    /// - SeeAlso: ``ObservableObject``
    @ObservedObject var passThroughViewModel = PTViewModel()

    /// The `body` property represents the main content and behaviors of the ``PTModeView``.
    var body: some View {
        // Define the status of LED for update UI.
        let status = passThroughViewModel.isLEDOn != nil ? passThroughViewModel.isLEDOn! ? String
            .titleEnabled : String.titleDisabled : String.messageLEDStateNotSet

        NFCOperationUIView(
            isOperationIconActive: .constant(passThroughViewModel.isLEDOn ?? false),
            operationMessage: passThroughViewModel.message,
            ledStatus: String(format: .messageForLEDState, status),
            buttonLedOnAction: {
                // Start the NFC session with message to turn on LED
                passThroughViewModel.ledStatus = true
                passThroughViewModel.startNFCTagReaderSession(withAlertMessage: String(
                    format: .messageToTabNBTDeviceToOnOffLED,
                    String.titleEnable.lowercased()
                ))
            },
            buttonLedOffAction: {
                // Start the NFC session with message to turn off LED
                passThroughViewModel.ledStatus = false
                passThroughViewModel.startNFCTagReaderSession(withAlertMessage: String(
                    format: .messageToTabNBTDeviceToOnOffLED,
                    String.titleDisable.lowercased()
                ))
            }
        ).onAppear(perform: {
            // Set message when view appears
            passThroughViewModel.message = .messageToClickButtonToConfigureLed
        })
    }
}

/// Provide previews and sample data for the `PTModeView` during the development process.
#Preview {
    PTModeView()
}
