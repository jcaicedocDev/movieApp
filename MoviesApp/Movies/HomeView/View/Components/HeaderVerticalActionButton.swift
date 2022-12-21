//
//  HeaderVerticalActionButton.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 17/12/2022.
//

import SwiftUI

struct HeaderVerticalActionButton: View {
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
            VStack {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .font(.footnote)
            }
        }
        .disabled(true)
    }
}
