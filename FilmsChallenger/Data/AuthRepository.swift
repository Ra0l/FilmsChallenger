//
//  AuthRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/28/25.
//

import Combine
import FirebaseAuth

protocol AuthRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
}

class AuthRepository: AuthRepositoryProtocol {
    private let auth = Auth.auth()
    
    func login(email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            self.auth.signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let user = result?.user {
                    let user = User(uid: user.uid, name: nil, email: user.email, createdAt: nil)
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
