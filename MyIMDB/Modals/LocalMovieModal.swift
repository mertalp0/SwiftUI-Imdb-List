//
//  LocalMovieModal.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import Foundation
struct LocalMovie: Identifiable , Decodable {
    var id : String
    let title: String
    let year: Int
    let imdbRating: Double
    let director: String
    let image: String
}
