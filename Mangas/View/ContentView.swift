//
//  ContentView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import SwiftUI

struct ContentView: View {
  @State var mangaVM = MangaVM()
  @State var vm = NetworkService.shared
  init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
   }
  var body: some View {
    
    NavigationStack{
      VStack{
        TabView{
          Group{
            HomeView(vm: vm, mangaVM: mangaVM)
              .tabItem {Label("Home", systemImage: "house").foregroundStyle(.black)}
            CategoryView()
              .tabItem {Label("Category", systemImage: "list.bullet").foregroundStyle(.white)}
            FavoriteView()
              .tabItem {Label("Favorite", systemImage: "star").foregroundStyle(.white)}
          }
        }.tint(.white)
      }
    }
  }
}

#Preview {
  ContentView()
}
