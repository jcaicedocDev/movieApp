//
//  MovieRepositoryProtocol.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getHomeMovies()
    func getMovieDetail(with movieId: Int)
}
