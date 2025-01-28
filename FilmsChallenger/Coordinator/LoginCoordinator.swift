//
//  LoginCoordinator.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit
import UIKit

protocol LoginCoordinatorProtocol {
    func goToHome()
    func showLoginErrorAlert()
    func goToRegisterAccount()
}

class LoginCoordinator: Coordinator, LoginCoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToHome() {
        let fetchMoviesUseCase = FetchMoviesUseCase(repository: MovieRepository())
        let movieListViewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase)
        let movieCoordinator = MovieCoordinator(navigationController: navigationController)
        let movieListVC = MovieListViewController(viewModel: movieListViewModel, coordinator: movieCoordinator)
        navigationController.pushViewController(movieListVC, animated: true)
    }
    
    func showLoginErrorAlert() {
        let alertController = UIAlertController(title: "Fallo en la autenticación",
                                                message: "Upps!! Usuario o contraseña incorrectos.",
                                                preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Intentar de nuevo", style: .default, handler: nil)
        alertController.addAction(dismiss)
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    func goToRegisterAccount() {
        let dataSource = UserDataSource()
        let repository = UserRepositoryImplement(dataSource: dataSource)
        let useCase = RegisterUseCase(userRepository: repository)
        let viewModel = RegisterViewModel(registerUserUseCase: useCase)
        let registerCoordinator = RegisterCoordinator(navigationController: navigationController)
        let registerViewController = RegisterViewController(viewModel: viewModel, coordinator: registerCoordinator)
        navigationController.pushViewController(registerViewController, animated: true)
    }
}
