//
//  MovieCell.swift
//  Flix
//
//  Created by Cesar Gutierrez on 9/22/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    var movie: Movie!{
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            
            let baseURLString = "https//image.tmdb.org/t/p.w500"
            let posterPathURL = URL(string: baseURLString + movie.posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
