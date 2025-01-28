//
//  UserRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

protocol UserRepositoryProtocol {
    func registerUser(email: String, password: String, name: String, completion: @escaping (Result<User, Error>) -> Void)
}

