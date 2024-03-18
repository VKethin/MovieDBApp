//
//  HomeView.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @StateObject private var vm = HomeViewModel()
    @Namespace var namespace
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("Movie Store")
                    .poppins(.bold, 28)
                
                Text(vm.errorMessage)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.genre) { genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedGenre = genre
                                        Task {
                                            await vm.fetchMoviesForSelectedGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(vm.moviesForSelectedGenre) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBlueColor1)
        .fullScreenCover(item: $vm.selectedMovie) { movie in
            DetailView(movie: movie)
        }
        .task {
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
            await vm.fetchGenre()
            await vm.fetchMoviesForSelectedGenre()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//#Preview {
//    HomeView()
//}
