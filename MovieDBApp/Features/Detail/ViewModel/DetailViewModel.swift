//
//  DetailViewModel.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    private let movieService = MovieService()
    
    @Published var errorMessage = ""
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response: ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            reviews = response.results
        } catch {
            print("Error: \(error)")
            errorMessage = "Error: \(error)"
        }
    }
}
