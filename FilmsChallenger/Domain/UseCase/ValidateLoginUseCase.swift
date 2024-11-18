//
//  ValidateLoginUseCase.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

struct ValidateLoginUseCase {
    private let validUsername = "Admin"
    private let validPassword = "Password*123"
    
    func validateLoginWithUser(_ username: String, password: String) -> Bool {
        return username == validUsername && password == validPassword
    }
}
