//
//  Movie+Stubs.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/21/21.
//

import Foundation

extension Movie {
    
    // Helps read the movies from the movie list json
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
}

extension Bundle {
    // Helps locate the url of the json files and decode the json data
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        let jsonDecoder = JsonDecoder.decode
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
        
    }
}
