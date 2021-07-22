//
//  MovieDetailListViewModel.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/22/21.
//

import SwiftUI

struct MovieDetailListViewModel: View {
    let movie: Movie
    
    var body: some View {
        List {
            MovieDetailImageViewModel(imageURL: self.movie.backdropURL)
            
            HStack {
                Text(movie.genreText)
                Text("·")
                Text(movie.yearText)
                Text(movie.durationText)
            }
            
            Text(movie.overview)
            
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
            
            Divider()
                .padding(.horizontal)
        }
    }
}

struct MovieDetailListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailListViewModel(movie: Movie.stubbedMovie)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}
