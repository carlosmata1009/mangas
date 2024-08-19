//
//  HomeView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI

struct HomeView: View {
  @Bindable var vm = NetworkService.shared
  @Bindable var mangaVM = MangaVM()
  var body: some View {
    
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack{
        ScrollView{
          PortadaView(images: $mangaVM.mangasAll)
          HorizontalScrollView(mangas: $mangaVM.mangasAll, mangasCategory: "All Mangas")
          HorizontalScrollView(mangas: $mangaVM.mangasBest, mangasCategory: "Best Mangas")
          HorizontalScrollView(mangas: $mangaVM.mangasAuthor, mangasCategory: "Author")
          HorizontalScrollView(mangas: $mangaVM.mangasDemographic, mangasCategory: "Demographics")
          HorizontalScrollView(mangas: $mangaVM.mangasTheme, mangasCategory: "Themes")
          HorizontalScrollView(mangas: $mangaVM.mangasGenre, mangasCategory: "Genre")
        }
      }
      .task{
        mangaVM.loadList()
      }
      .padding(.bottom)
    }
  }
}

#Preview {
    HomeView(mangaVM: MangaVM(networkService: MockDataTest()))
}
