//
//  FetchMoviesUseCase.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

class FetchMoviesUseCase {
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int, isOnline: Bool, completion: @escaping ([Movie]) -> Void) {
        
        if isOnline {
            repository.fetchMoviesFromApi(page: page) { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.repository.saveMovies(movies)
                    completion(movies)
                case .failure(_):
                    print("error fetchin movies")
                }
            }
        } else {
            let storedMovies = repository.fetchMovies()
            completion(storedMovies)
        }
    }
}
