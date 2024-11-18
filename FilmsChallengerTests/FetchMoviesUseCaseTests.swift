//
//  FetchMoviesUseCaseTests.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/20/24.
//

import XCTest
@testable import FilmsChallenger

class FetchMoviesUseCaseTests: XCTestCase {
    
    var sut: FetchMoviesUseCase!
    var mockRepository: MockMovieRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockMovieRepository()
        sut = FetchMoviesUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func test_fetchMovies_fromAPI_whenOnline() {

        let expectedMovies = [Movie(title: "Inception",
                                    posterPath: nil,
                                    releaseDate: "2010-07-16",
                                    voteAverage: 8.8,
                                    overview: "A mind-bending thriller.")]
        mockRepository.apiMovies = expectedMovies
        
        let expectation = self.expectation(description: "Movies fetched from API DBMovie")

        sut.execute(page: 1, isOnline: true) { movies in
            XCTAssertEqual(movies.count, expectedMovies.count, "The numbers of movies not coincide")
            XCTAssertEqual(movies.first?.title, expectedMovies.first?.title, "The title no coincide")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
