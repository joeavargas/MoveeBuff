//
//  JsonDecoder.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/21/21.
//

import Foundation

class JsonDecoder {
    static let decode: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-mm-dd"
        
        return dateFormatter
    }()
}
