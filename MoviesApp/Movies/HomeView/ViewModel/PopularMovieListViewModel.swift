//
//  PopularMovieListViewModel.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Combine

final class PopularMovieListViewModel: ListViewModeling {
    @Published private(set) var datasource: HomeMovies?
    @Published var showError = false
    @Published var isLoading = false
    @Published var movieIdSelected: Int = 0

    var errorMessage: String?
    private var repository: MoviesRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()

    init(repository: MoviesRepositoryProtocol = MoviesRepository()) {
      self.repository = repository
    }

    func loadData() {
        guard let moviesRepo = repository as? MoviesRepository else { return }

        moviesRepo.getHomeMovies()

        moviesRepo.$homeMovies.sink { movies in
            Task {
                await MainActor.run(body: {
                    self.datasource = movies
                })
            }
        }
        .store(in: &cancellables)

        moviesRepo.$error.sink { error in
            guard let someError = error else { return }
            Task {
                await self.handleFailure(error: someError)
            }
        }
        .store(in: &cancellables)
    }
}

private extension PopularMovieListViewModel {
    func handleFailure(error: Error) async {
        await MainActor.run(body: {
            errorMessage = "\(error)"
            showError = true
        })
    }
}
