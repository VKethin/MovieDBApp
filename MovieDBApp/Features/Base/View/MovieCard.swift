//
//  MovieCard.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieCardType = .poster
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWidth * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenWidth * type.heightPercent
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: dev.movie)
    }
}

//#Preview {
//    MovieCard(movie: dev.movie )
//}
