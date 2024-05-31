// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

/// An extension of the String type that defines the string constant used in application.
extension String {
    // MARK: - Application level constants

    /// Defines name of the application name.
    static let appName = "NBT Pass-Through"

    /// Defines sub title for application.
    static let subTitleForApp = "OPTIGA\u{2122}\u{00A0}Authenticate\u{00A0}NBT"

    /// Message to check NBT device is personalized.
    static let messageCheckAppletIsPersonalized =
        "Please make sure the OPTIGA™ Authenticate NBT is correctly personalized"

    /// The title for ``Retry``  button.
    static let buttonTitleRetry = "Retry"

    /// Message to retry again.
    static let messageRetry = ", please try again"

    /// The Empty string.
    /// - Note : There isn't a specific code point to unicode character code for the empty string
    /// (i.e., a string with zero characters).
    static let empty = ""

    /// Error message `Tag response error / no response` return by iOS in case of card is not able
    /// to respond to APDU command.
    static let errorMessageNoResponse = "Tag response error / no response"

    /// Message from iOS if NFC interface not ready.
    static let messageSystemResourceNotAvailable = "System resource unavailable"

    /// Message from iOS if NFC interface not ready.
    static let messageNfcNotReady = "NFC interface not ready"

    // MARK: - IFXComponents level constants

    /// The hint for the button.
    static let buttonTitleDefault = "Button"

    // MARK: - NFC device PT use case level constants

    /// The message for user to tap the NBT device to the iPhone to configure LED status as
    /// ON/OFF.
    static let messageToTabNBTDeviceToOnOffLED =
        "Please tap your iPhone to the OPTIGA\u{2122}\u{00A0}Authenticate\u{00A0}NBT to %@ the LED!"

    /// The message for user to click bellow buttons to configure LED status as ON/OFF.
    static let messageToClickButtonToConfigureLed =
        "Please click the buttons below to configure the LED status"

    /// The message for user to inform configuring LED status as ON/OFF.
    static let messageConfiguringLEDState = "Configuring LED status as %@"

    /// The message for user to inform configured LED status as ON/OFF..
    static let messageConfiguredLEDState = "Configuration successful"

    /// The constant represents the string enabled.
    static let titleEnabled = "enabled"

    /// The constant represents the string disabled.
    static let titleDisabled = "disabled"

    /// The title for config LED  buttons.
    static let buttonTitleConfigLED = "%@ LED"

    /// The message for user to inform configuring LED status is not set.
    static let messageLEDStateNotSet = "not set"

    /// The message for user to inform LED status
    static let messageForLEDState = "LED is %@"

    /// The constant represents the string enable.
    static let titleEnable = "Enable"

    /// The constant represents the string disable.
    static let titleDisable = "Disable"
}
