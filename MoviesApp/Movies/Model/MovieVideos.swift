//
//  MovieVideos.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

struct MovieVideos: Decodable {
    let id: Int
    let results: [Video]
}
