//
//  LoginViewModel.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//
import Foundation
import Combine

import Combine
import FirebaseAuth

class LoginViewModel {
    private var cancellables = Set<AnyCancellable>()
    private let loginUseCase: LoginUseCaseProtocol

    // Publishers para UI
    let loadingPublisher = CurrentValueSubject<Bool, Never>(false)
    let successPublisher = PassthroughSubject<Void, Never>()
    let errorPublisher = PassthroughSubject<String, Never>()

    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase(repository: AuthRepository())) {
        self.loginUseCase = loginUseCase
    }

    func loginWithUser(_ email: String, password: String) {
        loadingPublisher.send(true)

        loginUseCase.execute(email: email, password: password)
            .sink { [weak self] completion in
                self?.loadingPublisher.send(false)
                switch completion {
                case .failure(let error):
                    self?.errorPublisher.send(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] _ in
                self?.successPublisher.send(())
            }
            .store(in: &cancellables)
    }
}
