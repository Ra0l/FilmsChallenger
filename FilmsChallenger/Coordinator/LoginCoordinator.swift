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
}

class LoginCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        let router = LoginRouter(viewController: loginViewController)
        let interactor = LoginInteractor(loginRepository: LoginRepository())
        let presenter = LoginPresenter(view: loginViewController, interactor: interactor, router: router)
        loginViewController.presenter = presenter
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
