//
//  CastScrollView.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 20/12/2022.
//

import Combine
import SwiftUI

struct CastScrollView: View {
    @State var title: String
    var cast: [CastItem]

    var body: some View {
        VStack(alignment: .leading, spacing: .zero, content: {
            Text(title)
                .font(.headline)
                .padding(.horizontal, ViewConstants.textPadding)
            ScrollView(.horizontal,showsIndicators: false) {
                LazyVGrid(columns: generateGridItems(), spacing: .zero) {
                    ForEach(cast) { castItem in
                        CastRow(cast: castItem)
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
            count: cast.count)
        return columns
    }

    private enum ViewConstants {
        static let textPadding: CGFloat = 5
        static let gridItemSize: CGFloat = 90
        static let rowHeight: CGFloat = 130
    }
}

#if DEBUG
struct CastScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CastScrollView(title: "Cast", cast: [.preview])
    }
}
#endif
