//
//  UserDataSource.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserDataSource {
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    func registerUser(withEmail email: String, password: String, name: String, completion: @escaping(Result<User, Error>) -> Void){
        auth.createUser(withEmail: email, password: password) {authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = authResult?.user else {
                completion(.failure(NSError(domain: "UserCreationError", code: -1, userInfo: nil)))
                return
            }
            
            let userData = [
                "name": name,
                "email": email,
                "createdAt": FieldValue.serverTimestamp()
            ] as [String: Any]
            
            self.db.collection("users").document(user.uid).setData(userData) { error in
                if let error = error {
                    completion(.failure(error))
                }else {
                    let newUser = User(uid: user.uid, name: name, email: email, createdAt: Date())
                    completion(.success(newUser))
                }
            }
        }
    }
}
