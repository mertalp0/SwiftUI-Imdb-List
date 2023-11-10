//
//  MovieViewModal.swift
//  MyIMDB
//
//  Created by mert alp on 9.11.2023.
//

import Foundation

// ObservableObject : cünkü bir published oluşturuyorduk
class MovieListViewModal : ObservableObject {
    @Published var movieList  = [MovieViewModal]()
    let webService = WebService()

    func downloadMovie(movieName :String) async {

        do{
            let movies =  try await webService.fetchMovies(movieName: movieName)
            DispatchQueue.main.async {
                self.movieList = movies.map(MovieViewModal.init)
            }
        }catch {
            print(error)
            //yanlış isim girildiğinde ekrana hata çıkmalı.
                DispatchQueue.main.async {
                    self.movieList = []
               
                   
                }
        }
    }

}


struct MovieViewModal {
    let movie : Movie
    var id : UUID {
        movie.id
    }
    var title  : String {
        movie.title
    }
    var year  : String {
        movie.year
    }
    var imdbID  : String {
        movie.imdbID
    }
    var type  : String {
        movie.type
    }
    var poster  : String {
        movie.poster
    }
  
}





