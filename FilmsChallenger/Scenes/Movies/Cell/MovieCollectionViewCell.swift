//
//  MovieCollectionViewCellCell.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewContainer: ContentView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView() {
        imgMovie.contentMode = .scaleAspectFit
    }

    func configure(with movie: Movie) {
        lblTitle?.text = movie.title
        if let posterPath = movie.fullPosterPath {
            let url = URL(string: posterPath)
            imgMovie?.kf.setImage(with: url)
        } else {
            imgMovie?.image = UIImage(named: "placeholder")
        }
    }
}
