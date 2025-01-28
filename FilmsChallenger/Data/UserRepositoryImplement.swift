//
//  UserRepositoryImplement.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import CryptoKit

class UserRepositoryImplement: UserRepositoryProtocol {
    
    private let dataSource: UserDataSource
    
    init(dataSource: UserDataSource) {
        self.dataSource = dataSource
    }
    
    func registerUser(email: String, password: String, name: String, completion: @escaping (Result<User, any Error>) -> Void) {
        let encryptedPassword = sha256(password)
        dataSource.registerUser(withEmail: email, password: password, name: name, completion: completion)
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
