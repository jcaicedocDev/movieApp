//
//  CastItem.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

struct CastItem: Identifiable {
    let id: Int
    let name: String
    let character: String
    let photo: String?

    init(id: Int, name: String, character: String, photo: String?) {
        self.id = id
        self.name = name
        self.character = character
        self.photo = photo
    }

    var photoURL: URL? {
        if let photoPath = photo {
           return URL(string: "\(CommonAPI.baseImagesURL)\(photoPath)")
        }
        return nil
    }

#if DEBUG
    init() {
        id = 000
        name = "John Doe"
        character = "John Doe Character"
        photo = "/blKKsHlJIL9PmUQZB8f3YmMBW5Y.jpg"
    }

    static var preview: CastItem {
        CastItem()
    }
#endif
}
