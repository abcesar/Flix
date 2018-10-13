//
//  PosterCell.swift
//  Flix
//
//  Created by Cesar Gutierrez on 9/22/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            posterImageView.af_setImage(withURL: movie.posterURL!)
        }
    }
    
}
