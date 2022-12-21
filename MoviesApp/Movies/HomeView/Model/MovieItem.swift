//
//  MovieItem.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 15/12/2022.
//

import SwiftUI

struct MovieItem: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?

    init(
        id: Int,
        title: String,
        overview: String,
        posterPath: String?
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }

    var photoURL: URL? {
        guard let moviePoster = posterPath else { return nil }

        return URL(string: "\(CommonAPI.baseImagesURL)\(moviePoster)")
    }

#if DEBUG
    init(title: String, overview: String) {
        self.title = title
        self.overview = overview
        id = 000
        posterPath = "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg"
    }

    static var preview: MovieItem {
        MovieItem(
            title: "Best movie ever",
            overview: """
    This an overview of the movie, with a long enough description.
    This will allow to check long text descriptions. Sed ut perspiciatis,
    unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
    totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae
    vitae dicta sunt, explicabo.
    """
        )
    }
#endif

}
