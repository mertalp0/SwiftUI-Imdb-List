//
//  ContentView.swift
//  MyIMDB
//
//  Created by mert alp on 9.11.2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0 // Seçilen sekmenin izlenmesi için bir state ekleyin
    var body: some View {
        TabView(selection: $selectedTab) {
            ImdbView()
                .tabItem {
                    Image(systemName: "film")
                    Text("IMDB")
                }
                .tag(0) // Sekmenin benzersiz bir kimliğini belirtin
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            RecordedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Like")
                }
                .tag(2)
        }
        .accentColor(.blue) // Seçilen sekmenin renk
        .onAppear {
            UITabBar.appearance().barTintColor = .black
        }
    }
}
#Preview {
    TabBarView()
}

