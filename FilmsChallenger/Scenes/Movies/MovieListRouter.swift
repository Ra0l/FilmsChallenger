//
//  MovieListRouter.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/17/24.
//

import Foundation
import UIKit

class MovieListRouter: MovieListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func goToDetail(movie: Movie) {
        let detailVC = MovieDetailViewController(movie: movie)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func navigateToMovieDetail(for movie: Movie) {
        let detailVC = MovieDetailViewController(movie: movie)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
