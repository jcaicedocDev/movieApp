//
//  Cast.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

struct Cast: Decodable {
    let id: Int
    let department: String
    let name: String
    let character: String
    let photo: String?
    let order: Int

    enum CodingKeys: String, CodingKey {
        case id, character, order
        case department = "known_for_department"
        case name = "original_name"
        case photo = "profile_path"
    }
}
