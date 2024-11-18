//
//  MovieDetailViewController.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/20/24.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    private let movie: Movie
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupData()
    }
    
    private func setupView() {
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(voteAverageLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            posterImageView.widthAnchor.constraint(equalToConstant: 120),
            posterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            voteAverageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            voteAverageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            releaseDateLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: voteAverageLabel.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func formattedReleaseDate(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "es_ES")
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "d 'de' MMMM 'del' yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        }
        
        return dateString
    }
    
    private func setupData() {
        titleLabel.text = movie.title
        voteAverageLabel.text = "Puntaje:\n\(movie.voteAverage)"
        releaseDateLabel.text = "Fecha de lanzamiento:\n\(formattedReleaseDate(from: movie.releaseDate))"
        overviewLabel.text = movie.overview
        
        if let posterPath = movie.fullPosterPath, let url = URL(string: posterPath) {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(named: "placeholder")
        }
    }
}
