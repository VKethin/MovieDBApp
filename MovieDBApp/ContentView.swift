//
//  ContentView.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: HomeView()) {
                    Text("Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
