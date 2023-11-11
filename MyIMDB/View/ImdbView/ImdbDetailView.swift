//
//  ImdbDetailView.swift
//  MyIMDB
//
//  Created by mert alp on 11.11.2023.
//

import SwiftUI
import Kingfisher

struct ImdbDetailView: View {
    let movie : LocalMovieViewModal
    init(movie: LocalMovieViewModal)   {
        self.movie = movie
    }
    var body: some View {
        VStack {
            ScrollView {
                Image(movie.image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width  , height: 300) // ekranın widthini alma
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.white, lineWidth: 3)
                            .shadow(color: .white, radius: 5, x: 0, y: 5) // Gölge ekleme
                    )
                Text(movie.title)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.red)
                HStack{
                    Text("IMDB :")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.red)
                    Text(String(movie.imdbRating))
                    
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 3)
                        )
                    
                    Spacer()
                }
                HStack{
                 Text("About")
                 .font(.footnote)
                 .fontWeight(.bold)
                 .padding()
                 .foregroundColor(.red)
                 Spacer()
                 }
                 
            
                Text(movie.plot)
                 .font(.footnote)
                 .fontWeight(.bold)
                 .padding()
                 .foregroundColor(.white)
                 
                HStack{
                    Text("Year")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.red)
                    Text(String(movie.year))
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                }
            }.background(.black)}
    }
}

#Preview {
    ImdbDetailView(movie: LocalMovieViewModal(movie: LocalMovie(id: "", title: "", year: 0, imdbRating: 0, director: "", image: "" , plot: "")))
}
