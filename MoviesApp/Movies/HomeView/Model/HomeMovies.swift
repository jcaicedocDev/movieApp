//
//  HomeMovies.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import SwiftUI

final class HomeMovies: Identifiable, ObservableObject {
    let popularMovies: [MovieItem]
    let topRatedMovies: [MovieItem]
    let tredingMovies: [MovieItem]

    init(tredingMovies: [MovieItem], popularMovies: [MovieItem], topRatedMovies: [MovieItem]) {
        self.tredingMovies = tredingMovies
        self.popularMovies = popularMovies
        self.topRatedMovies = topRatedMovies
    }

#if DEBUG
    init() {
        self.popularMovies = Array.init(repeating: MovieItem.preview, count: 10)
        self.topRatedMovies = Array.init(repeating: MovieItem.preview, count: 10)
        self.tredingMovies = Array.init(repeating: MovieItem.preview, count: 10)
    }

    static var preview: HomeMovies {
        HomeMovies()
    }
#endif
}
