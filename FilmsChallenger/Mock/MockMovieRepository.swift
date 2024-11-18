//
//  MockMovieRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/20/24.
//

import Foundation

class MockMovieRepository: MovieRepositoryProtocol {
    
    var shouldReturnError = false
    var shouldReturnMoviesFromCoreData = false
    
    var apiMovies: [Movie] = []
    var coreDataMovies: [Movie] = []
    
    func fetchMoviesFromApi(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "API Error"])))
        } else {
            completion(.success(apiMovies))
        }
    }
    
    func saveMovies(_ movies: [Movie]) {
    }
    
    func fetchMovies() -> [Movie] {
        if shouldReturnMoviesFromCoreData {
            return coreDataMovies
        }
        return []
    }
}
