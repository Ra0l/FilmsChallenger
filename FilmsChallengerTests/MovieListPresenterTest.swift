//
//  MovieListPresenterTest.swift
//  FilmsChallengerTests
//
//  Created by Raul Kevin Aliaga Shapiama on 11/17/24.
//

import Testing
import XCTest
@testable import FilmsChallenger

class MovieListPresenterTests: XCTestCase {
    var presenter: MovieListPresenter!
    var mockView: MockMovieListView!
    var mockInteractor: MockMovieListInteractor!
    var mockRouter: MockMovieListRouter!

    override func setUp() {
        super.setUp()
        mockView = MockMovieListView()
        mockInteractor = MockMovieListInteractor()
        mockRouter = MockMovieListRouter()
        presenter = MovieListPresenter(view: mockView, interactor: mockInteractor, router: mockRouter)
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func test_viewDidLoad_ShowsLoadingAndFetchesMovies() {
        // Act
        presenter.viewDidLoad()

        // Assert
        XCTAssertTrue(mockView.didShowLoading)
        XCTAssertEqual(mockInteractor.fetchMoviesCallCount, 1)
        XCTAssertTrue(mockInteractor.isFetchMoviesCalled)
        XCTAssertEqual(mockInteractor.lastFetchMoviesPage, 1)
    }
    
    func test_didFetchMovies_UpdatesMoviesAndHidesLoading() {
        // Arrange
        let movies = [Movie(title: "Inception",
                            posterPath: nil,
                            releaseDate: "2010-07-16",
                            voteAverage: 8.8,
                            overview: "A mind-bending thriller.")]
        
        // Act
        presenter.didFetchMovies(movies)
        
        // Assert
        XCTAssertEqual(presenter.numberOfMovies, movies.count)
        XCTAssertTrue(mockView.didHideLoading)
    }
    
    func test_loadMoreMovies_IncrementsPageAndFetchesMovies() {
        // Act
        presenter.loadMoreMovies(isOnline: true)
        
        // Assert
        XCTAssertEqual(mockInteractor.fetchMoviesCallCount, 1)
        XCTAssertEqual(mockInteractor.lastFetchMoviesPage, 2)
    }

    func test_goToDetail_NavigatesToMovieDetail() {
        // Arrange
        let movie = Movie(title: "Inception",
                          posterPath: nil,
                          releaseDate: "2010-07-16",
                          voteAverage: 8.8,
                          overview: "A mind-bending thriller.")
        
        // Act
        presenter.goToDetail(movie: movie)
        
        // Assert
        XCTAssertTrue(mockRouter.didNavigateToMovieDetail)
    }
}

// MARK: - Mock Classes

class MockMovieListView: MovieListViewProtocol {
    var didShowLoading = false
    var didHideLoading = false
    var displayedMovies: [Movie]?
    
    func showLoading() {
        didShowLoading = true
    }
    
    func hideLoading() {
        didHideLoading = true
    }
    
    func displayMovies(_ movies: [Movie]) {
        displayedMovies = movies
    }
}

class MockMovieListInteractor: MovieListInteractorProtocol {
    var isFetchMoviesCalled = false
    var fetchMoviesCallCount = 0
    var lastFetchMoviesPage: Int?
    
    func fetchMovies(isOnline: Bool, page: Int) {
        isFetchMoviesCalled = true
        fetchMoviesCallCount += 1
        lastFetchMoviesPage = page
    }
}

class MockMovieListRouter: MovieListRouterProtocol {
    var didNavigateToMovieDetail = false
    var moviePassedToDetail: Movie?
    
    func navigateToMovieDetail(for movie: Movie) {
        didNavigateToMovieDetail = true
        moviePassedToDetail = movie
    }
}
