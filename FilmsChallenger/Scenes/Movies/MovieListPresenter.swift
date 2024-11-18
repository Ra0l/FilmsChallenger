//
//  MovieListPresenter.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/17/24.
//

import Foundation
import UIKit

class MovieListPresenter: MovieListPresenterProtocol {
    private weak var view: MovieListViewProtocol?
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    private var movies: [Movie] = []
    private var currentPage = 1

    init(view: MovieListViewProtocol, interactor: MovieListInteractorProtocol, router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var numberOfMovies: Int {
        return movies.count
    }
    
    func viewDidLoad() {
        view?.showLoading()
        interactor.fetchMovies(isOnline: Network.shared.isConnected, page: currentPage)
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func loadMoreMovies(isOnline: Bool) {
        view?.showLoading()
        currentPage += 1
        interactor.fetchMovies(isOnline: isOnline, page: currentPage)
    }
    
    func didFetchMovies(_ movies: [Movie]) {
        self.movies.append(contentsOf: movies)
        view?.hideLoading()
        DispatchQueue.main.async {
            self.view?.displayMovies(self.movies)
        }
    }
    
    func goToDetail(movie: Movie) {
        router.navigateToMovieDetail(for: movie)
    }
}
