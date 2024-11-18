//
//  MovieRepository.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation
import CoreData

class MovieRepository: MovieRepositoryProtocol {
    
    private let remoteDataSource: ServiceMovieDataSourceProtocol
    let context: NSManagedObjectContext
    
    init(remoteDataSource: ServiceMovieDataSourceProtocol = ServiceMovieDataSource(),
         context: NSManagedObjectContext = CoreDataManager.shared.context) {
        self.remoteDataSource = remoteDataSource
        self.context = context
    }
    
    func fetchMoviesFromApi(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        remoteDataSource.fetchMovies(page: page, completion: completion)
    }
    
    func saveMovies(_ movies: [Movie]) {
        for movie in movies {
            let movieEntity = MovieEntity(context: context)
            movieEntity.title = movie.title
            movieEntity.posterPath = movie.posterPath
            movieEntity.releaseDate = movie.releaseDate
            movieEntity.voteAverage = movie.voteAverage
            movieEntity.overview = movie.overview
        }
        
        do {
            try context.save()
        } catch {
            print("Error guardando películas en Core Data: \(error)")
        }
    }
    
    func fetchMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        
        do {
            let movieEntities = try context.fetch(fetchRequest)
            return movieEntities.map { entity in
                return Movie(
                    title: entity.title ?? "",
                    posterPath: entity.posterPath,
                    releaseDate: entity.releaseDate ?? "",
                    voteAverage: entity.voteAverage,
                    overview: entity.overview ?? ""
                )
            }
        } catch {
            print("Error recuperando películas de Core Data: \(error)")
            return []
        }
    }

}
