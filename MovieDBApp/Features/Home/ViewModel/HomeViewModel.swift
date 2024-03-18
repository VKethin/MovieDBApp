//
//  HomeViewModel.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var errorMessage = ""
    @Published var selectedGenre = DeveloperPreview.instance.genre
    @Published var selectedMovie: Movie? = nil
    
    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            trendingMovies = movieApiResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchTopRatedMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            topRatedMovies = movieApiResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchGenre() async {
        do {
            let response: GenreResponse = try await movieService.fetchData(api: .init(endpoint: .genre))
            genre = response.genres
            if let genre = genre.first {
                selectedGenre = genre
            }
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
            let response: MovieResponse = try await movieService.fetchData(api: api)
            moviesForSelectedGenre = response.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
}
