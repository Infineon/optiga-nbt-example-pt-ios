// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation
import InfineonApdu
import InfineonApduNbt
import InfineonUtils

/// Collection of commands supported by the NBT NBT device pass through demo application.
public class PTDemoCommandSet: ApduCommandSet {
    /// Constructor of NBT device pass through command set to configure the reference of
    /// communication channel and log channel number.
    ///
    /// - Parameter channel: Reference of communication channel associated with
    ///   command handler.
    ///
    /// - Throws: An ``APDUError`` if AID object cannot be converted into a byte array.
    /// - Throws: A ``UtilError`` if instance is unable to create the NBT command builder.
    ///
    public init(channel: ApduChannel) throws {
        try super.init(aid: NBTPTConstants.aid, channel: channel)
    }

    /// Selects the NBT pass through demo application.
    ///
    /// - Returns: Returns the response with status word.
    ///
    /// - Throws: An ``APDUError`` in case command creation or communication
    /// fails.
    public func selectApplication() async throws -> ApduResponse {
        let selectAIDCommand = try ApduCommand(
            cla: NbtConstants.cla,
            ins: NbtConstants.insSelect,
            param1: NbtConstants.p1SelectApplication,
            param2: NbtConstants.p2Default,
            data: getAid(),
            lengthExpected: Int(NbtConstants.leAny)
        )
        return try await send(apduCommand: selectAIDCommand)
    }

    /// Creates and send APDU command to control the LED of the NBT pass through demonstrator
    ///
    /// - Returns the response with status word of APDU command to enable/disable LED
    /// - Throws An ``APDUError``, in case command creation or communication fails.
    public func setLedByPassthrough(state: Bool) async throws -> ApduResponse {
        let selectSetLED = try ApduCommand(
            cla: NbtConstants.cla,
            ins: NBTPTConstants.insConfigureLed,
            param1: NbtConstants.p1Default,
            param2: state ? NBTPTConstants.ledOn : NBTPTConstants.ledOff,
            data: nil,
            lengthExpected: Int(NbtConstants.leAbsent)
        )
        return try await send(apduCommand: selectSetLED)
    }
}
