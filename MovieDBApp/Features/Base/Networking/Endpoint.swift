//
//  Endpoint.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

enum Endpoint {
    case trending, topRated, genre, movieReviews(_ movieId: Int), discoverMovies
    
    private var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)/reviews"
        case .discoverMovies:
            return "/3/discover/movie"
        }
    }
    
    var fullPath: String {
        Constants.apiBaseUrl + path
    }
}
