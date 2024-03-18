//
//  Genre.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable {
    let genres: [Genre]
}
