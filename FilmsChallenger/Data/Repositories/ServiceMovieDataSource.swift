//
//  RemoteMovieDataSource.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

protocol ServiceMovieDataSourceProtocol {
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void)
}

class ServiceMovieDataSource: ServiceMovieDataSourceProtocol {
    private let apiKey = "a381377045f01e9e491feea2aee4d6de"
    private let baseUrl = "https://api.themoviedb.org/3/movie/upcoming"
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: "\(baseUrl)?page=\(page)&api_key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                for (index, movies) in movieResponse.results.enumerated() {
                    print("\(index + 1).- \(movies.title) - \(movies.voteAverage)")
                }
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
