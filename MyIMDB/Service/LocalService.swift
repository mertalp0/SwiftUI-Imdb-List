//
//  LocalService.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import Foundation

class LocalService {
    func fetchMovies() async throws -> [LocalMovie] {

        guard let path = Bundle.main.path(forResource: Constants.Paths.baseUrl, ofType: "json") else {
            fatalError("Resource not found")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        let a = try JSONDecoder().decode([LocalMovie].self, from: data)
        print(a)
        return a

    }

    
    
    
    
    
}
