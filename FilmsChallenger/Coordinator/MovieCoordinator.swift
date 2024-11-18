//
//  MovieCoordinator.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/20/24.
//

import UIKit

protocol MovieCoordinatorProtocol {
    func goToDetail(movie: Movie)
}

class MovieCoordinator: MovieCoordinatorProtocol {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func goToDetail(movie: Movie) {
        print("Go To Detail Movie")
        let detailVC = MovieDetailViewController(movie: movie)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
