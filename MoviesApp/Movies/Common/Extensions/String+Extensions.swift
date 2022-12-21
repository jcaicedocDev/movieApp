//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
