//
//  MovieListInteractor.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/17/24.
//

import Foundation

class MovieListInteractor: MovieListInteractorProtocol {
    private let fetchMoviesUseCase: FetchMoviesUseCase
    weak var presenter: MovieListPresenterProtocol?
    
    init(fetchMoviesUseCase: FetchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
    
    func fetchMovies(isOnline: Bool, page: Int) {
        fetchMoviesUseCase.execute(page: page, isOnline: isOnline) { [weak self] movies in
            guard let self = self else { return }
            self.presenter?.didFetchMovies(movies)
        }
    }
}
