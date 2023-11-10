//
//  Const.swift
//  MyIMDB
//
//  Created by mert alp on 9.11.2023.
//

import Foundation

struct Constants {

    struct Urls {
        static let baseUrl : String = "https://api.collectapi.com/imdb"
        static let movieUrl = "\(baseUrl)/imdbSearchByName?query="
        static let movieDetailUrl = "\(baseUrl)/imdbSearchById?movieId=tt5295894"

    }
    
    struct ApiKeys{
        static let collectApiKey : String = "2f0TewcEEbKCEDnMsjNdzt:0bV9qLuWfvPiBbm8vsNf73"
    }
    struct Headers{
        static let collectApiHeaders = [
          "content-type": "application/json",
          "authorization": "apikey \(ApiKeys.collectApiKey)"
        ]
    }
    struct Paths {
            static let baseUrl = "imdbData"
        }
    
    }
