//
//  HeaderMovieView.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 16/12/2022.
//

import SwiftUI
import Kingfisher

struct HeaderMovieView: View {
    private var movie: MovieItem?
    private var viewHeight: CGFloat
    init(movie: MovieItem?, viewHeight: CGFloat) {
        self.movie = movie
        self.viewHeight = viewHeight
    }

    var body: some View {
        VStack {

            KFImage(movie?.photoURL)
                .placeholder {
                    ProgressView()
                }
                .resizable()                
        }
        .frame(height: viewHeight)
        .overlay(alignment: .bottom) {
            HStack {
                Spacer()

                HeaderVerticalActionButton(buttonTitle: "my_list_title".localized, iconName: "plus", buttonAction: {
                    debugPrint("Add to list")
                })

                Spacer()

                HeaderHorizontalActionButton(buttonTitle: "play_title".localized, iconName: "play.fill", buttonAction: {
                    debugPrint("Add to list")
                })

                Spacer()

                HeaderVerticalActionButton(buttonTitle: "info_title".localized, iconName: "info.circle", buttonAction: {
                    debugPrint("Info")
                })
                Spacer()

            }
            .frame(minWidth: ViewConstants.viewWidth, maxWidth: .infinity)
        }
    }

    private enum ViewConstants {
        static let viewWidth: CGFloat = 250
        static let minHeight: CGFloat = 350
    }
}

#if DEBUG
struct HeaderMovieView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMovieView(movie: .preview, viewHeight: 600)
    }
}
#endif
