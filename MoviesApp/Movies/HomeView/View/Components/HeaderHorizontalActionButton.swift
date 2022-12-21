//
//  HeaderHorizontalActionButton.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 17/12/2022.
//

import SwiftUI

struct HeaderHorizontalActionButton: View {
    private var buttonTitle: String
    private var iconName: String
    private var buttonAction: () -> ()

    init(buttonTitle: String, iconName: String, buttonAction: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.iconName = iconName
        self.buttonAction = buttonAction
    }

    var body: some View {
        Button {
            buttonAction()
        } label: {
            HStack {
                Image(systemName: iconName)

                Text(buttonTitle)
                    .font(.footnote)
            }
        }
        .frame(width: ViewConstants.buttonWidth, height: ViewConstants.buttonHeight)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(ViewConstants.cornerRadius)
        .disabled(true)
    }

    private enum ViewConstants {
        static let buttonWidth: CGFloat = 100
        static let buttonHeight: CGFloat = 30
        static let cornerRadius: CGFloat = 5
    }
}
