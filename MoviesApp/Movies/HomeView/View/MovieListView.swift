//
//  MovieListView.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Combine
import SwiftUI

struct MovieListView<ViewModel: ListViewModeling>: View where ViewModel.DataItem == HomeMovies {
    @ObservedObject var viewModel: ViewModel
    @State private var isPresented = false

    init(viewModel: ViewModel = PopularMovieListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    let treddingMovie = viewModel.datasource?.tredingMovies.first
                    HeaderMovieView(movie: treddingMovie, viewHeight: geo.size.height * 0.8)

                    MoviesScrollView(title: "treading_section_title".localized, movies: viewModel.datasource?.tredingMovies ?? []) { movieIdSelected in
                        viewModel.movieIdSelected = movieIdSelected
                        isPresented = true
                    }

                    MoviesScrollView(title: "popular_section_title".localized, movies: viewModel.datasource?.popularMovies ?? []) { movieIdSelected in
                        viewModel.movieIdSelected = movieIdSelected
                        isPresented = true
                    }

                    MoviesScrollView(title: "toprated_section_title".localized, movies: viewModel.datasource?.topRatedMovies ?? []) { movieIdSelected in
                        viewModel.movieIdSelected = movieIdSelected
                        isPresented = true
                    }
                }
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        debugPrint("airplayvideo")
                    } label: {
                        Image(systemName: "airplayvideo")
                            .foregroundColor(.white)
                    }
                    .disabled(true)

                    Button {
                        debugPrint("user settings")
                    } label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.white)
                    }
                    .disabled(true)

                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                DetailMovieView(viewModel: DetailMovieViewModel(movieId: viewModel.movieIdSelected))
            }
        }
        .onAppear {
          viewModel.loadData()
        }
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
                title: Text("alert_error_title".localized),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}

#if DEBUG
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
#endif
