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
    var posterURL: URL?
    var releaseDate: String
    var backdropURL: URL?
    
    
    init(dictionary: [String: Any]) {
        
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        
        
        let posterPath = dictionary["poster_path"] as? String ?? "No poster path"
        let backdropPath = dictionary["backdrop_path"] as? String ?? "No backdrop path"
        let baseURL = "https://image.tmdb.org/t/p/w500"
        posterURL = URL(string: baseURL + posterPath)
        backdropURL = URL(string: baseURL + backdropPath)
    }
    
    
    class func convertDictionaryToMovie(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
    
}
