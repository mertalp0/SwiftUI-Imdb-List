//
//  ImdbView.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import SwiftUI

struct ImdbView: View {
    @ObservedObject var localMovieListViewModal : LocalMovieListViewModal
    init() {
        self.localMovieListViewModal = LocalMovieListViewModal()
    }
    var body: some View {
        NavigationStack{
            List {
                Section(header: Text("IMDB")) {
                    ForEach(localMovieListViewModal.movieList, id: \.id) { movie in
                        NavigationLink {
                           // UPDATE 
                            ImdbDetailView(movie:movie)
                            
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(movie.image)
                                        .resizable()  // Resizin yapılabilir olduğunu belirtiyoruz
                                      //  .aspectRatio(contentMode: .fit)  // Resmin oranını korumak için .fit kullanıyoruz
                                        .frame(width: 50, height: 50)  

                                    Text(movie.title)
                                        .cornerRadius(5)
                                
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .padding()
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text(String(movie.imdbRating))
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .padding()
                                        .foregroundColor(.red)
                                }
                            }
                        }

                    }
                }
            }
        }
        .task {
            await localMovieListViewModal.downloadMovies()
        }
    }
}



#Preview {
    ImdbView()
}
