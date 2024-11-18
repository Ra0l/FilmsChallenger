//
//  LoginRouter.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/16/24.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    func navigateToHomeScreen()
}

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?

    init(viewController: UIViewController?) {
        self.viewController = viewController
    }

    func navigateToHomeScreen() {
        let fetchMoviesUseCase = FetchMoviesUseCase(repository: MovieRepository())

        let movieListVC = MovieListViewController()
        
        let router = MovieListRouter(viewController: movieListVC)
        let interactor = MovieListInteractor(fetchMoviesUseCase: fetchMoviesUseCase)
        let presenter = MovieListPresenter(view: movieListVC, interactor: interactor, router: router)
        
        movieListVC.presenter = presenter
        interactor.presenter = presenter
        router.viewController = movieListVC
        
        viewController?.navigationController!.pushViewController(movieListVC, animated: true)
    }
}
