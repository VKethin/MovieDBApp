//
//  CustomImageView.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    var imageType: MovieImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.AppBlueColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(itemWidth: 150, itemHeight: 150, movie: dev.movie)
    }
}

//#Preview {
//    CustomImageView()
//}
