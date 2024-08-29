//
//  ContentView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
  @Environment(\.modelContext) var context
  @State var searchText = ""
  
  var body: some View {
    VStack{
      TabView{
        HomeView(modelContext: context)
          .tabItem {Label("Home", systemImage: "house")}
        SearchView()
          .tabItem { Label("Search", systemImage: "magnifyingglass") }
        CategoryListView()
          .tabItem {Label("Category", systemImage: "list.bullet")}
          .navigationTitle("Categories")
        FavoriteView(mangas: Items.itemsTest.items)
          .tabItem {Label("Favorite", systemImage: "star")}
      }
    }
  }
}

#Preview {
  do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: MangaCategory.self, configurations: config)
      
      return ContentView()
          .modelContainer(container)
  } catch {
      fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
  }
}

