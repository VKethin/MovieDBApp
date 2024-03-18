//
//  GenreCard.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import SwiftUI

struct GenreCard: View {
    let genre: Genre
    let namespace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18)
            .background(
                ZStack {
                    if selectedGenre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.AppPurpleColor)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

struct GenreCard_Previews: PreviewProvider {
    static var previews: some View {
        GenreCard(genre: dev.genre, namespace: Namespace().wrappedValue, selectedGenre: .constant(dev.genre))
    }
}
//#Preview {
//    GenreCard(genre: <#Genre#>)
//}
