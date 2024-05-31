// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation

/// Stores basic constants for the NBT PT use case app.
public enum NBTPTConstants {
    /// The constant defines the time delay for DispatchQueue to execute task after 3.0 sec
    public static let timeDelay = 3.0

    /// The constant defines the one
    public static let one = 1

    /// AID for NBT pass through demo application
    public static let aid = Data([0x01, 0x02, 0x03, 0x04, 0x05])

    /// The constant defines the LED On command byte
    public static let ledOn: UInt8 = 0x01

    /// The constant defines the LED Off command byte
    public static let ledOff: UInt8 = 0x00

    /// Instruction byte for the NBT pass through demo application command: setLedByPassthrough .
    public static let insConfigureLed: UInt8 = 0x00
}
