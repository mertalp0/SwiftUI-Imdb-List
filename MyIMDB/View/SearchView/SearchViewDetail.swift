//
//  SearchViewDetail.swift
//  MyIMDB
//
//  Created by mert alp on 11.11.2023.
//

import SwiftUI

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
                        Text(movieDetail.country)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.blue)
                    } else {
                        ProgressView("Loading...")
                    }
                }
                .task {
                    await a.downloadMovieDetail(imdbId: imdbId)
                }
            }
        }
#Preview {
    SearchViewDetail(imdbId: "")
}
