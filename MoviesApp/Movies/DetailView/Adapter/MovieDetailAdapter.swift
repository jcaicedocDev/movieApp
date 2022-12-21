//
//  MovieDetailAdapter.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

struct MovieDetailAdapter {
    static func detailMovie(
        _ detail: MovieDetail,
        movieVideos: MovieVideos,
        cast: [Cast],
        recomendations: [Movie]) -> DetailMovie {

            let genres = detail.genres.map { $0.name }.joined(separator: ",")
            let vote = (5 * detail.voteAverage)/10.0
            let videoid = movieVideos.results.filter {
                $0.site.lowercased() == "youtube"
            }.first?.key ?? ""

            let castItems = cast.map {
                CastItem(id: $0.id, name: $0.name, character: $0.character, photo: $0.photo)
            }

            let recomendationsMovie = recomendations.map { MovieAdaptor.toMovieItem($0)}

            return DetailMovie(
                title: detail.title,
                overview: detail.overview,
                duration: detail.runtime.movieTime,
                votes: Decimal(vote),
                genres: genres,
                videoId: videoid,
                cast: castItems,
                recomendations: recomendationsMovie)
    }
}
