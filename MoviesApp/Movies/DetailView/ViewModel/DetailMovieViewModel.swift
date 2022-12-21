//
//  DetailMovieViewModel.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Combine

final class DetailMovieViewModel: DetailViewModeling {

    @Published private(set) var datasource: DetailMovie?
    @Published var showError = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var castTitle = ""
    @Published var recomendationTitle = ""

    private var repository: MoviesRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    private var movieId: Int

    init(repository: MoviesRepositoryProtocol = MoviesRepository(), movieId: Int) {
        self.repository = repository
        self.movieId = movieId
    }

    func loadData() {
        guard let moviesRepo = repository as? MoviesRepository else { return }

        moviesRepo.getMovieDetail(with: movieId)

        moviesRepo.$detailMovie.sink { detailMovie in
            Task {
                await MainActor.run(body: {
                    self.datasource = detailMovie
                    if let recomendations = self.datasource?.recomendations, !recomendations.isEmpty {
                        self.recomendationTitle = "recomendations_title".localized
                    }

                    if let cast = self.datasource?.cast, !cast.isEmpty {
                        self.castTitle = "cast_title".localized
                    }
                })
            }
        }
        .store(in: &cancellables)

        moviesRepo.$error.sink { error in
            guard let someError = error else { return }
            Task {
                await MainActor.run(body: {
                    self.errorMessage = "\(someError)"
                    self.showError = true
                })
            }
        }
        .store(in: &cancellables)
    }
}
