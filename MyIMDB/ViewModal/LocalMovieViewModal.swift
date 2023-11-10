//
//  LocalMovieViewModal.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import Foundation

class LocalMovieListViewModal : ObservableObject {
    @Published var movieList  = [LocalMovieViewModal]()
 
    
    let localService = LocalService()

    func downloadMovies() async {


        do{
            let movies =  try await localService.fetchMovies()
          
            DispatchQueue.main.async {
                self.movieList = movies.map(LocalMovieViewModal.init)
            }
        }catch {
            print(error)
       
        }
    }

}


struct LocalMovieViewModal {
    
    let movie : LocalMovie
    var id : String {
        movie.id
    }
    var title  : String {
        movie.title
    }
    var year  : Int {
        movie.year
    }
    var imdbRating  : Double {
        movie.imdbRating
    }
    var director  : String {
        movie.director
    }
    var image  : String {
        movie.image
    }}



