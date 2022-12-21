//
//  MovieRow.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import SwiftUI
import Kingfisher

struct MovieRow: View {
    @State var movie: MovieItem

    var body: some View {
        VStack {
            KFImage(movie.photoURL)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.imageWidth, height: ViewConstants.imageHeight)
        }
    }

    private enum ViewConstants {
        static let imageWidth: CGFloat = 80
        static let imageHeight: CGFloat = 130
    }
}

#if DEBUG
struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: MovieItem.preview)
    }
}
#endif
