//
//  MovieProtocols.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 11/17/24.
//

import Foundation
import UIKit

protocol MovieListViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func displayMovies(_ movies: [Movie])
}

protocol MovieListInteractorProtocol: AnyObject {
    func fetchMovies(isOnline: Bool, page: Int)
}

protocol MovieListPresenterProtocol: AnyObject {
    var numberOfMovies: Int { get }
    func viewDidLoad()
    func movie(at index: Int) -> Movie
    func loadMoreMovies(isOnline: Bool)
    func didFetchMovies(_ movies: [Movie])
    func goToDetail(movie: Movie)
}

protocol MovieListRouterProtocol: AnyObject {
    func navigateToMovieDetail(for movie: Movie)
}
