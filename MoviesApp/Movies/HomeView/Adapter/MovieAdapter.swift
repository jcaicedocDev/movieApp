//
//  MovieAdapter.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Foundation

struct MovieAdaptor {
    static func homeMovies(_ treading:[Movie], popular: [Movie], topRated: [Movie]) -> HomeMovies {
        HomeMovies(
            tredingMovies: treading.map({ toMovieItem($0)}),
            popularMovies: popular.map({ toMovieItem($0)}),
            topRatedMovies: topRated.map({ toMovieItem($0)}))
    }

    static func toMovieItem(_ movie: Movie) -> MovieItem {
        return MovieItem(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            posterPath: movie.posterPath
        )
    }
}
