//
//  MovieDetailView.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/21/21.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        NavigationView {
            ZStack {
                LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                    self.movieDetailState.loadMovie(id: self.movieId)
                }
              
                if movieDetailState.movie != nil {
                    // Movie details Section
                    MovieDetailListViewModel(movie: self.movieDetailState.movie!)                  
                }
            }
            .navigationBarTitle(movieDetailState.movie?.title ?? "")
            .onAppear{
                self.movieDetailState.loadMovie(id: self.movieId)
            }
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: Movie.stubbedMovie.id)
    }
}
