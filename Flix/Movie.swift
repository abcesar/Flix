//
//  Movie.swift
//  Flix
//
//  Created by Cesar Gutierrez on 10/8/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import Foundation
class Movie {
    
    var title: String
    var overview: String
    var posterPathString: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        posterPathString = dictionary["poster_path"] as? String ?? "No posterPath"
        // Set the rest of the properties
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
