//
//  ContentView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import SwiftUI

struct ContentView: View {
  
  @State var searchText = ""
  
  var body: some View {
    VStack{
      TabView{
        HomeView()
          .tabItem {Label("Home", systemImage: "house")}
//        SearchView()
//          .tabItem { Label("Search", systemImage: "magnifyingglass") }
        CategoryListView()
          .tabItem {Label("Category", systemImage: "list.bullet")}
          .navigationTitle("Categories")
        FavoriteView()
          .tabItem {Label("Favorite", systemImage: "star")}
      }
    }
  }
}

#Preview {
  ContentView()
}
