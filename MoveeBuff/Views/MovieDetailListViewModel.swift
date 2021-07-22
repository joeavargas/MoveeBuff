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
            
            HStack(alignment: .top, spacing: 4){
                
                // Starring actors
                if movie.cast != nil && movie.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 5){
                        Text("Starring")
                            .font(.headline)
                        
                        ForEach(self.movie.cast!.prefix(9)){ cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4){
                        // Directors
                        if movie.crew != nil && movie.crew!.count > 0 {
                            VStack(alignment: .leading, spacing: 4){
                                if movie.directors != nil && movie.directors!.count > 0 {
                                    Text("Directors").font(.headline)
                                    ForEach(self.movie.directors!.prefix(2)) { crew in
                                        Text(crew.name)

                                    }
                                }
                            }
                        }

                        // Producers
                        if movie.producers != nil && movie.producers!.count > 0 {
                            Text("Producers").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }

                        // Writers
                        if movie.screenWriters != nil && movie.screenWriters!.count > 0 {
                            Text("Writer(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            Divider()
        }
    }
}

//struct MovieDetailListViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailListViewModel(movie: Movie.stubbedMovie)
//            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//    }
//}
