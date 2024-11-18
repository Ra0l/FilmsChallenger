//
//  LoginRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

protocol LoginRepositoryProtocol {
    func loginWithUser(_ username: String, password: String) -> Bool
}

class LoginRepository: LoginRepositoryProtocol {
    private let validateLoginUseCase = ValidateLoginUseCase()
    
    func loginWithUser(_ username: String, password: String) -> Bool {
        return validateLoginUseCase.validateLoginWithUser(username, password: password)
    }
}
