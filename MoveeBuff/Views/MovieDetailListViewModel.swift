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
        }
    }
}

struct MovieDetailListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailListViewModel(movie: Movie.stubbedMovie)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}
