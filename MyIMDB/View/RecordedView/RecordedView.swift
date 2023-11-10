//
//  RecordedView.swift
//  MyIMDB
//
//  Created by mert alp on 10.11.2023.
//

import SwiftUI

struct RecordedView: View {
    let service = WebService()
 
    var body: some View {
        Button(action: {
            Task{
                print("sgfdh")
                let ass = try  await service.fetchMoviesDetail(imdbId:"sdgf")
                print("sgfdh")
                print(ass.imdbRating)
                
            }
                         
                      }) {
                          Image(systemName: "magnifyingglass")
                              .foregroundColor(.blue)
                              .padding(8)
                      }
                      .padding(.top, 10)
                  }

    }


#Preview {
    RecordedView()
}
