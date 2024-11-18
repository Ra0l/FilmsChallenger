//
//  LoginPresenter.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/16/24.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    func loginButtonPressed(username: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol

    init(view: LoginViewProtocol, interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func loginButtonPressed(username: String, password: String) {
        let isLoggedIn = interactor.login(username: username, password: password)
        if isLoggedIn {
            router.navigateToHomeScreen()
        } else {
            view?.showLoginError("Fallo la autenticación")
        }
    }
}
