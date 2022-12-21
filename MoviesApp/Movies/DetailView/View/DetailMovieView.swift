//
//  DetailMovieView.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 17/12/2022.
//

import Combine
import SwiftUI
import YouTubePlayerKit

struct DetailMovieView<ViewModel: DetailViewModeling>: View where ViewModel.DataItem == DetailMovie {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: ViewModel
    @State private var offset: CGSize = .zero

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 15, content: {

                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                    }
                    .frame(width: 28, height: 28)
                }
                .padding(.trailing, 15)

                if let videoId = viewModel.datasource?.videoId, !videoId.isEmpty {
                    YouTubePlayerView(YouTubePlayer(source: .video(id: videoId)))
                        .frame(width: geo.size.width, height: geo.size.height * 0.4)
                } else {
                    VStack{}
                        .frame(width: geo.size.width, height: geo.size.height * 0.4)
                        .background(Color.black)
                }


                ScrollView {
                    VStack(spacing: 5) {
                        Text(viewModel.datasource?.title ?? "")
                            .frame(width: geo.size.width - 10, alignment: .leading)
                            .font(.title)
                        HStack {
                            Text(viewModel.datasource?.title ?? "")
                                .font(.subheadline)
                            Text(viewModel.datasource?.duration ?? "")
                                .font(.subheadline)
                        }
                        .frame(width: geo.size.width - 10, alignment: .leading)

                        HStack {
                            FiveStarView(rating: viewModel.datasource?.votes ?? 0)
                                .frame(minWidth: 1, idealWidth: 100, maxWidth: 150, minHeight: 1, idealHeight: 20, maxHeight: 20, alignment: .center)
                            Spacer()
                        }
                        .frame(width: geo.size.width - 10)
                        
                    }

                    Text(viewModel.datasource?.overview ?? "")
                        .font(.body)
                        .frame(width: geo.size.width - 10, alignment: .leading)
                        .padding(.vertical, 15)


                    CastScrollView(title: viewModel.castTitle, cast: viewModel.datasource?.cast ?? [])

                    MoviesScrollView(title: viewModel.recomendationTitle, movies: viewModel.datasource?.recomendations ?? [])
                }
                .frame(width: geo.size.width)
            })
            .onAppear {
                viewModel.loadData()
            }
        }
        .simultaneousGesture(
            DragGesture()
                .onChanged({ gesture in
                    if gesture.translation.width < 50 {
                        offset = gesture.translation
                    }
                })
                .onEnded({ _ in
                    if abs(offset.height) > 100 {
                        dismiss()
                    } else {
                        offset = .zero
                    }
                })
        )
    }
}

#if DEBUG
struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(viewModel: DetailMovieViewModel(movieId: 76600))
    }
}
#endif
