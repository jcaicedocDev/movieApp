//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

struct MovieDetail: Decodable {
    let id: Int
    let title: String
    let overview: String
    let runtime: Int
    let voteAverage: Double
    let genres: [Genre]

    enum CodingKeys: String, CodingKey {
        case id, title, runtime, overview, genres
        case voteAverage = "vote_average"
    }
}
