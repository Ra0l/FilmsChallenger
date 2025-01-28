//
//  RegisterViewModel.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import Combine

class RegisterViewModel{
    private let registerUserUseCase: RegisterUseCase
    // Publishers
    let successPublisher = PassthroughSubject<String, Never>()
    let errorPublisher = PassthroughSubject<String, Never>()
    let loadingPublisher = PassthroughSubject<Bool, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(registerUserUseCase: RegisterUseCase) {
        self.registerUserUseCase = registerUserUseCase
    }
    
    func registerUser(email: String, password: String, name: String) {
        loadingPublisher.send(true)
        registerUserUseCase.execute(email: email, password: password, name: name){ [weak self] result in
            DispatchQueue.main.async{
                self?.loadingPublisher.send(false)
                switch result {
                case .success(let user):
                    self?.successPublisher.send("Usuario creado: \(user.name)")
                case .failure(let error):
                    self?.errorPublisher.send(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
