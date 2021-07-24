//
//  MovieDetailImageViewModel.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/22/21.
//

import SwiftUI

struct MovieDetailImageViewModel: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let imageURL: URL
    var body: some View {
        ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear{
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

struct MovieDetailImageViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailImageViewModel(imageURL: Movie.stubbedMovie.backdropURL)
    }
}
