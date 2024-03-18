//
//  DetailView.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import SwiftUI

enum DetailViewSection: String {
    case about, review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text("2023")
                    Text(" | ")
                    Image.ClockIcon
                    Text("150 minutes")
                    Text(" | ")
                    Image.GenreIcon
                    Text("Action")
                    Text(" | ")
                }
                .foregroundColor(.AppGrayColor2)
                .frame(maxWidth: .infinity)
                
                Text(vm.errorMessage)
                
                HStack {
                    ForEach(vm.sections, id: \.self) { section in
                        DetailSectionCard(section: section, namespace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    vm.selectedSection = section
                                }
                            }
                    }
                }
                
                switch vm.selectedSection {
                case .about:
                    Text(vm.movie.overview)
                case .review:
                    ScrollView {
                        VStack {
                            ForEach(vm.reviews) { review in
                                ReviewCard(review: review)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBlueColor3)
        .task {
            await vm.fetchReviews()
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    
    var backdropImageSize: CGFloat {
        screenHeight * 0.22
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.12
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.12
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: dev.movie)
    }
}

private extension DetailView {
    var header: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
                HStack {
                    Image.BackIcon
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
//                    Spacer()
                    Text("Movie Detail")
                    Spacer()
                }
                .padding()
                .background(Color.AppBlueColor3)
            }
            
            HStack {
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: vm.movie, imageType: .backdrop)
                Text(vm.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top, titleOffset)
            }
            .padding()
            .offset(y: backdropImageOffset)
        }
    }
}

//#Preview {
//    DetailView()
//}
