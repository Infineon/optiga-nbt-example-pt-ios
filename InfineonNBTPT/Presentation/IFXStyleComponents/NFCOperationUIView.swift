// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view to the used for different NBT operation use case
struct NFCOperationUIView: View {
    /// Indicates whether a icon or image used in the user interface is active/inactive.
    @Binding public var isOperationIconActive: Bool

    /// Represents the title displayed in the user interface.
    public var title: String = .appName

    /// Represents a message associated with a specific operation to be perform.
    public var operationMessage: String = .empty

    /// Represents the name or identifier of an icon or image used in the user interface.
    public var operationIcon: String = Images.lightIcon

    /// Represents a message associated with a specific input operation to be perform.
    public var inputMessage: String = .empty

    /// Represents a message associated with a specific LED status.
    public var ledStatus: String

    /// Represents a title for button LED on.
    public var buttonLedOnTitle: String = .init(format: .buttonTitleConfigLED, String.titleEnable)

    /// Represents a title for button LED off.
    public var buttonLedOffTitle: String = .init(format: .buttonTitleConfigLED, String.titleDisable)

    /// Optional holder for call back action for  button LED on.
    public var buttonLedOnAction: (() -> Void)?

    /// Optional holder for call back action for  button LED off.
    public var buttonLedOffAction: (() -> Void)?

    /// The ``body`` property represents the main content and behaviors of the ``NbtOperationView``.
    var body: some View {
        VStack {
            // Header view
            HeaderView(title: title)

            // Operation message
            Text(operationMessage)
                .font(.body3)
                .foregroundColor(Color.baseBlack)
                .padding(.leading)
                .padding(.trailing)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: StandardPointDimension.extraLargeHeight)

            Spacer()

            // Operation icon or image
            Image(operationIcon)
                .resizable()
                .renderingMode(.template)
                .frame(
                    width: StandardPointDimension.operationImageSize,
                    height: StandardPointDimension.operationImageSize
                )
                .foregroundColor(isOperationIconActive ? Color.ocean500 : Color.gray)
            Text(verbatim: ledStatus)
                .font(.body3)
                .foregroundColor(Color.baseBlack)
                .padding(.leading)
                .padding(.trailing)
                .multilineTextAlignment(.center)
            Spacer()
            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/) {
                if let callback = buttonLedOnAction {
                    IFXButton(title: buttonLedOnTitle, action: callback)
                }

                if let callback = buttonLedOffAction {
                    IFXButton(title: buttonLedOffTitle, action: callback)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

/// Provide previews and sample data for the ``NFCOperationUIView`` during the development process.
#Preview {
    NFCOperationUIView(
        isOperationIconActive: .constant(true),
        ledStatus: .messageToTabNBTDeviceToOnOffLED,
        buttonLedOnAction: {},
        buttonLedOffAction: {}
    )
    .preferredColorScheme(.light)
}
