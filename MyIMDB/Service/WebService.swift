//
//  WebService.swift
//  MyIMDB
//
//  Created by mert alp on 9.11.2023.
//

import Foundation


class WebService {
    func fetchMoviesDetail(imdbId : String) async throws -> MovieDetail {
        guard let url = URL(string:Constants.Urls.movieDetailUrl+imdbId)else {
            //print("Geçersiz URL")
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.Headers.collectApiHeaders
        let session = URLSession.shared
        do{
            let (data,response) = try await session.data(for: request)
            if let httpResponse = response as? HTTPURLResponse{
                
                if httpResponse.statusCode == 200 {
                    do{ let result = try JSONDecoder().decode(MovieDetailResponse.self, from: data)
                        let movieDetail = result.result
                        print("movie detail : \(movieDetail)")
                        return movieDetail
                    }catch {
                       // print("Hata: \(error)")
                        throw error
                    }
                    
                }
                else {
                  //  print("HTTP Hata Kodu: \(httpResponse.statusCode)")
                }
                
            }
        }
        catch {
           print("Hata: \(error)")
          //  throw error
        }
        throw NetworkError.invalidUrl
    }
    
    
    func fetchMovies(movieName: String) async throws -> [Movie] {
        guard let url = URL(string: "\(Constants.Urls.movieUrl + movieName)" )else {
          //  print("Geçersiz URL")
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.Headers.collectApiHeaders
        let session = URLSession.shared
        do {
            let (data, response) = try await session.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                        let movies = result.result
                        print(movies.count)
                        return movies
                    } catch {
                        print("Hata: \(error)")
                        throw error
                    }
                } else {
                    print("HTTP Hata Kodu: \(httpResponse.statusCode)")
                }
            }
        } catch {
            print("Hata: \(error)")
            throw error
        }
        throw NetworkError.invalidUrl

    }
 
}


struct MovieDetailResponse: Decodable {
    let success: Bool
    let result: MovieDetail
}
struct MovieResponse: Decodable {
    let success: Bool
    let result: [Movie]
}


enum NetworkError : Error {
    
    case invalidUrl
    case invalidServerResponse
}




/*
 // will be add \(movieName)"
 guard let url = URL(string: Constants.Urls.movieUrl) else {
 throw NetworkError.invalidUrl
 }
 let (data,response) = try await  URLSession.shared.data(from: url)
 guard let httpResponse = response as? HTTPURLResponse ,  httpResponse.statusCode == 200  else{
 
 throw NetworkError.invalidServerResponse
 }
 return try JSONDecoder().decode([Movie].self, from:  data)
 */
