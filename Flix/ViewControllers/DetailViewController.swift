//
//  DetailViewController.swift
//  Flix
//
//  Created by Cesar Gutierrez on 9/22/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit

//enum MovieKeys{
//    static let title = "title"
//    static let date = "release_date"
//    static let overview = "overview"
//    static let backdropPath = "backdrop_path"
//    static let posterPath = "poster_path"
//}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if let movie = movie {
            
            titleLabel.text = movie.title as String
            releaseDateLabel.text = movie.releaseDate as String
            overviewLabel.text = movie.overview as String
            
            backDropImageView.af_setImage(withURL: movie.backdropURL!)
            posterImageView.af_setImage(withURL: movie.posterURL!)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
