//
//  MoviesScrollView.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 15/12/2022.
//

import Combine
import SwiftUI

struct MoviesScrollView: View {
    @State var title: String
    var movies: [MovieItem]
    var tapAction: ((Int) -> ())?

    var body: some View {
        VStack(alignment: .leading, spacing: .zero, content: {
            Text(title)
                .font(.headline)
                .padding(.horizontal, ViewConstants.textPadding)
            ScrollView(.horizontal,showsIndicators: false) {
                LazyVGrid(columns: generateGridItems(), spacing: .zero) {
                    ForEach(movies) { movie in
                        MovieRow(movie: movie)
                            .onTapGesture {
                                tapAction?(movie.id)
                            }
                    }
                }
            }
            .frame(height: ViewConstants.rowHeight)
            .padding(.vertical, .zero)
        })
    }

    private func generateGridItems() -> [GridItem] {
        let columns: [GridItem] = Array.init(
            repeating: GridItem(.fixed(ViewConstants.gridItemSize), spacing: .zero),
            count: movies.count)
        return columns
    }

    private enum ViewConstants {
        static let textPadding: CGFloat = 5
        static let gridItemSize: CGFloat = 90
        static let rowHeight: CGFloat = 130
    }
}

#if DEBUG
struct MoviesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScrollView(title: "treading_section_title".localized, movies: [.preview])
    }
}
#endif
