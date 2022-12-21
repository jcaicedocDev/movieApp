//
//  CastRow.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 20/12/2022.
//

import SwiftUI
import Kingfisher


struct CastRow: View {
    @State var cast: CastItem

    var body: some View {
        VStack {
            KFImage(cast.photoURL)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.imageWidth, height: ViewConstants.imageHeight)
                .clipShape(Circle())

            Text(cast.character)
                .font(.footnote)
                .lineLimit(1)
                .frame(width: ViewConstants.imageWidth)
        }
    }

    private enum ViewConstants {
        static let imageWidth: CGFloat = 80
        static let imageHeight: CGFloat = 80
    }
}

#if DEBUG
struct CastRow_Previews: PreviewProvider {
    static var previews: some View {
        CastRow(cast: CastItem.preview)
    }
}
#endif
