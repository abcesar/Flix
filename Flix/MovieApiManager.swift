//
//  MovieApiManager.swift
//  Flix
//
//  Created by Cesar Gutierrez on 10/13/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import Foundation

class MovieApiManager {
    
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    static let api_key = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    
    func getNowPlayingMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
        
        let url = URL(string: MovieApiManager.baseURL + "now_playing?api_key=\(MovieApiManager.api_key)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                let movies = Movie.convertDictionaryToMovie(dictionaries: movieDictionaries)
                completion(movies, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
