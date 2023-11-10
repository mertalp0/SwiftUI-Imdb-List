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
        List {
            Section(header: Text("IMDB")) {
                ForEach(localMovieListViewModal.movieList, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(movie.image)
                                .resizable()  // Resizin yapılabilir olduğunu belirtiyoruz
                              //  .aspectRatio(contentMode: .fit)  // Resmin oranını korumak için .fit kullanıyoruz
                                .frame(width: 50, height: 50)  // 20x20 boyutunda bir çerçeve belirtiyoruz

                            Text(movie.title)
                                .cornerRadius(5)
                        
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.blue)
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
        .task {
            await localMovieListViewModal.downloadMovies()
        }
    }
}



#Preview {
    ImdbView()
}
