//
//  RegisterUseCase.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation

class RegisterUseCase {
    private let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute(email: String, password: String, name: String, completion: @escaping(Result<User, Error>) -> Void) {
        userRepository.registerUser(email: email, password: password, name: name, completion: completion)
    }
}
