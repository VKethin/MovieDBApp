//
//  PreviewProvider.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let movie = Movie(
        adult: false,
        backdropPath: "",
        genreIDS: [1],
        id: 10,
        originalLanguage: "",
        originalTitle: "",
        overview: "",
        popularity: 10.00,
        posterPath: "/sMp34cNKjIb18UBOCoAv4DpCxwY.jpg",
        title: "Damsel",
        releaseDate: "",
        video: false,
        voteAverage: 10.00,
        voteCount: 1
    )
    
    let genre = Genre(id: 28, name: "Action")
    
    let review = Review(author: "Testing Author", authorDetails: nil, content: "Testing Author Content", createdAt: "2022", id: "Testing", updatedAt: "Test", url: "Testing")
}

