// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view represent splash screen of mobile phone application for the pass-through (PT)
/// use case of the NBT.
struct SplashScreenView: View {
    /// An observed object representing the view model for ``SplashScreenView``. This observed
    /// object property hold ViewModel and responsible for splash screen operations.
    ///
    /// - SeeAlso: ``ObservableObject``
    @ObservedObject var splashScreenViewModel = SplashScreenViewModel()

    /// The ``body`` property represents the main content and behaviors of the ``SplashScreenView``.
    var body: some View {
        ZStack {
            // If splash screen is active show splash screen image else PT view will
            // visible.
            if splashScreenViewModel.isActive {
                Image(Images.splashScreenImage)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            } else {
                PTModeView()
            }
        }.onAppear {
            // Activate PT offline view after delay.
            splashScreenViewModel.deactivateAfterDelay()
        }
    }
}

// Provide previews and sample data for the `SplashScreenView` during the development process.
#Preview {
    SplashScreenView()
}
