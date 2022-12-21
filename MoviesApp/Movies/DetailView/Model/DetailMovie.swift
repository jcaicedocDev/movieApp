//
//  DetailMovie.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

final class DetailMovie: Identifiable, ObservableObject {
    let title: String
    let overview: String
    let duration: String
    let votes: Decimal
    let genres: String
    let videoId: String
    let cast: [CastItem]
    let recomendations: [MovieItem]

    init(
        title: String,
        overview: String,
        duration: String,
        votes: Decimal,
        genres: String,
        videoId: String,
        cast: [CastItem],
        recomendations: [MovieItem]) {
            self.title = title
            self.overview = overview
            self.duration = duration
            self.votes = votes
            self.genres = genres
            self.videoId = videoId
            self.cast = cast
            self.recomendations = recomendations
        }

#if DEBUG
    init() {
        self.title = "Avatar: The Way of Water"
        self.overview = "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure."
        self.duration = "3h 12m"
        self.votes = 3.6
        self.genres = "Science Fiction, Action, Adventure"
        self.videoId = "wbcfC92X2Y0"
        self.cast = Array.init(repeating: CastItem.preview, count: 10)
        self.recomendations = Array.init(repeating: MovieItem.preview, count: 10)

    }

    static var preview: HomeMovies {
        HomeMovies()
    }
#endif
}
