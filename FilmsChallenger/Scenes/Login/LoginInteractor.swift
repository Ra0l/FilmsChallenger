//
//  LoginInteractor.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/16/24.
//

import Foundation
import UIKit

protocol LoginInteractorProtocol: AnyObject {
    func login(username: String, password: String) -> Bool
}

class LoginInteractor: LoginInteractorProtocol {
    private let loginRepository: LoginRepositoryProtocol

    init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }

    func login(username: String, password: String) -> Bool {
        return loginRepository.loginWithUser(username, password: password)
    }
}
