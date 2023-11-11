//
//  Movie.swift
//  MyIMDB
//
//  Created by mert alp on 9.11.2023.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let id = UUID()
    let title, year, imdbID, type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID 
        case type = "Type"
        case poster = "Poster"
    }
}

