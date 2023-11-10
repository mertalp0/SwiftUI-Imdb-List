//
//  SearchView.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import SwiftUI

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @ObservedObject var movieListViewModal : MovieListViewModal
     init() {
         self.movieListViewModal = MovieListViewModal()
     }

    var body: some View {
        
        NavigationStack {
            VStack {
                HStack{
                    TextField("Search", text: $searchText, onCommit: {
                    })
                    Button("Ara") {
                        Task {
                            await movieListViewModal.downloadMovie(movieName:searchText)
                          }
                    }
                }
        
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                if movieListViewModal.movieList.isEmpty && searchText.isEmpty {
                       Text("Lütfen arama yapın")
                           .foregroundColor(.gray)
                           .padding()
                            Spacer()
                   } else {
                      
                           List(movieListViewModal.movieList, id: \.id) { movie in
                               NavigationLink{
                                   SearchViewDetail(imdbId: movie.imdbID)
                               }label: {
                                   Text(movie.title)
                                       .font(.footnote)
                                       .fontWeight(.bold)
                                       .padding()
                                       .foregroundColor(.blue)
                               
                           }
                       }
                   }
                
               
            }
        }
                    
            
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}



/*
 
 class MovieListViewModal: ObservableObject {
     @Published var movieList = [Movie]() // Movie modeline göre ayarlayın
     @Published var filteredMovieList = [Movie]() // Filtrelenmiş liste

     func downloadUsers() async {
         // Verileri indir ve movieList ve filteredMovieList'e ata
         // Bu işlemi async olarak yapabilirsiniz
     }

     func searchMovies(with searchText: String) {
         if searchText.isEmpty {
             filteredMovieList = movieList
         } else {
             filteredMovieList = movieList.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
         }
     }
 }
 */


/*
 @ObservedObject var movieListViewModal : MovieListViewModal
  init() {
      self.movieListViewModal = MovieListViewModal()
  }
 var body: some View {
    List(movieListViewModal.movieList, id: \.id){movie in
             VStack{
                 Text(movie.title ).font(.footnote).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
             }
         }.task {
             await movieListViewModal.downloadUsers()
         }
     }
 */
