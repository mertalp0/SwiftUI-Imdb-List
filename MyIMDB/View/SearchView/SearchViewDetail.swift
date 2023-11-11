//
//  SearchViewDetail.swift
//  MyIMDB
//
//  Created by mert alp on 11.11.2023.
//

import SwiftUI
import Kingfisher
struct SearchViewDetail: View {
    @ObservedObject var a : MovieDetailListViewModal
    let imdbId : String
    init(imdbId: String)   {
        self.imdbId = imdbId
        self.a = MovieDetailListViewModal()
    }
    var body: some View {
        VStack {
            if let movieDetail = a.movieDetail.first {
                ScrollView {
                    KFImage(URL(string: movieDetail.poster))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width  , height: 300) // ekranın widthini alma
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.white, lineWidth: 3)
                                .shadow(color: .white, radius: 5, x: 0, y: 5) // Gölge ekleme
                        )
                    Text(movieDetail.title)
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
                        Text(movieDetail.imdbRating)
                      
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
                    Text(movieDetail.plot)
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
                        Text(movieDetail.year)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                    }
                   
                    
                    
                    
        
                }
                
            } else {
                ProgressView("Loading...")
            }
        }
        .background(.black)
        .task {
            await a.downloadMovieDetail(imdbId: imdbId)
        }
    }
}
#Preview {
    SearchViewDetail(imdbId: "")
}
