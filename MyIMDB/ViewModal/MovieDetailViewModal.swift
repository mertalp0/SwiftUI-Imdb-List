//
//  MovieDetailViewModal.swift
//  MyIMDB
//
//  Created by mert alp on 11.11.2023.
//

import Foundation


class MovieDetailListViewModal : ObservableObject {
    @Published var movieDetail =  [MovieDetailViewModal]()
    let webService = WebService()
    
    //update olmalı
    func downloadMovieDetail(imdbId : String) async {
        do {
            let movieDetails = try await webService.fetchMoviesDetail(imdbId: imdbId)
            var list  = [MovieDetail]()
            list.append(movieDetails)
            DispatchQueue.main.async {
                self.movieDetail = list.map(MovieDetailViewModal.init)
            }
        }catch {
            print(error)
        }
    }
}

struct MovieDetailViewModal {
    let movieDetail: MovieDetail
    
    var id: UUID {
        movieDetail.id
    }
    
    var title: String {
        movieDetail.title
    }
    
    var year: String {
        movieDetail.year
    }
    
    var rated: String {
        movieDetail.rated
    }
    
    var released: String {
        movieDetail.released
    }
    
    var runtime: String {
        movieDetail.runtime
    }
    
    var genre: String {
        movieDetail.genre
    }
    
    var director: String {
        movieDetail.director
    }
    
    var writer: String {
        movieDetail.writer
    }
    
    var actors: String {
        movieDetail.actors
    }
    
    var plot: String {
        movieDetail.plot
    }
    
    var language: String {
        movieDetail.language
    }
    
    var country: String {
        movieDetail.country
    }
    
    var awards: String {
        movieDetail.awards
    }
    
    var poster: String {
        movieDetail.poster
    }
    
    var ratings: [RatingViewModel] {
        movieDetail.ratings.map { RatingViewModel(rating: $0) }
    }
    
    var metascore: String {
        movieDetail.metascore
    }
    
    var imdbRating: String {
        movieDetail.imdbRating
    }
    
    var imdbVotes: String {
        movieDetail.imdbVotes
    }
    
    var imdbID: String {
        movieDetail.imdbID
    }
    
    var type: String {
        movieDetail.type
    }
    
    var dvd: String {
        movieDetail.dvd
    }
    
    var boxOffice: String {
        movieDetail.boxOffice
    }
    
    var production: String {
        movieDetail.production
    }
    
    var website: String {
        movieDetail.website
    }
    
    var response: String {
        movieDetail.response
    }
}

struct RatingViewModel {
    let rating: Rating
    
    var source: String {
        rating.source
    }
    
    var value: String {
        rating.value
    }
}






