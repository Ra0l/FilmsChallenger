//
//  Movie.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let overview: String
    
    var fullPosterPath: String? {
        guard let posterPath = posterPath else { return nil }
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview
    }
} 
