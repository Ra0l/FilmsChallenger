//
//  MovieRepositoryProtocol.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func saveMovies(_ movies: [Movie])
    func fetchMovies() -> [Movie]
    func fetchMoviesFromApi(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void)
}
