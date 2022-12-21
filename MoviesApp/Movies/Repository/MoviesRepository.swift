//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Combine
import Foundation

class MoviesRepository: MoviesRepositoryProtocol {
    private var requestHandler: RequestHandling

    @Published var homeMovies: HomeMovies?
    @Published var detailMovie: DetailMovie?
    @Published var error: Swift.Error?

    init(requestHandler: RequestHandling = RequestHandler()) {
        self.requestHandler = requestHandler
    }

    func getHomeMovies() {
        let popularUrlRequest = PopularMoviesEndpoint().asRequest()
        let treadingUrlRequest = TredingMoviesEndpoint().asRequest()
        let topRatedUrlRequest = TopRatedMoviesEndpoint().asRequest()

        Task {
            let popularResponse = await executeRequest(withRequest: popularUrlRequest, dataType: MovieList.self)
            let treadingResponse = await executeRequest(withRequest: treadingUrlRequest, dataType: MovieList.self)
            let topRatedResponse = await executeRequest(withRequest: topRatedUrlRequest, dataType: MovieList.self)

            do {
                let popularList = try popularResponse.get()
                let treadingList = try treadingResponse.get()
                let topRatedList = try topRatedResponse.get()
                self.homeMovies =  MovieAdaptor.homeMovies(
                    treadingList.results,
                    popular: popularList.results,
                    topRated: topRatedList.results)
            } catch {
                self.error = error
            }
        }

    }

    func getMovieDetail(with movieId: Int) {
        let movieDetailRequest = MovieDetailEndpoint(movieId: movieId).asRequest()
        let movieVideosRequest = MovieVideoEndpoint(movieId: movieId).asRequest()
        let movieCastRequest = MovieCastEndpoint(movieId: movieId).asRequest()
        let movieRecomendationsRequest = MovieRecomendationsEndpoint(movieId: movieId).asRequest()

        Task {
            let movieDetailResponse = await executeRequest(withRequest: movieDetailRequest, dataType: MovieDetail.self)
            let movieVideoResponse = await executeRequest(withRequest:  movieVideosRequest, dataType: MovieVideos.self)
            let movieCastResponse =  await executeRequest(withRequest: movieCastRequest, dataType: MovieCast.self)
            let movieRecomendationResponse = await executeRequest(withRequest: movieRecomendationsRequest, dataType: MovieList.self)

            do {
                let movieDetail = try movieDetailResponse.get()
                let movieVideo = try movieVideoResponse.get()
                let movieCast = try movieCastResponse.get()
                let movieRecomendation = try movieRecomendationResponse.get()

                self.detailMovie = MovieDetailAdapter.detailMovie(
                    movieDetail,
                    movieVideos: movieVideo,
                    cast: movieCast.cast,
                    recomendations: movieRecomendation.results)
            } catch {
                self.error = error
            }
        }
    }
}

extension MoviesRepository {
    func executeRequest<T>(withRequest request: URLRequest, dataType: T.Type) async -> Result<T, RequestError> where T: Decodable {
        await requestHandler.request(request: request, dataType: dataType)
    }
}
