//
//  LoginUseCase.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/28/25.
//

import Combine
import FirebaseAuth

protocol LoginUseCaseProtocol {
    func execute(email: String, password: String) -> AnyPublisher<User, Error>
}

class LoginUseCase: LoginUseCaseProtocol {
    private let repository: AuthRepositoryProtocol

    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }

    func execute(email: String, password: String) -> AnyPublisher<User, Error> {
        return repository.login(email: email, password: password)
    }
}
