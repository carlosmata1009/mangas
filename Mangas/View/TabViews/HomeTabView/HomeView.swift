//
//  HomeView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
  @State var mangaVM: HomeVM = HomeVM()
  @State var searchText = ""
  
  var body: some View {
    NavigationStack{
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea(.all)
        VStack{
          ScrollView{
            //if categories.isEmpty{
              //PortadaView(images: $mangaVM.mangasAll)
              HorizontalScrollView(mangas: mangaVM.mangasAll, mangasCategory: "All Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasBest, mangasCategory: "Best Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasAuthor, mangasCategory: "Author")
              HorizontalScrollView(mangas: mangaVM.mangasDemographic, mangasCategory: "Demographics")
              HorizontalScrollView(mangas: mangaVM.mangasTheme, mangasCategory: "Themes")
              HorizontalScrollView(mangas: mangaVM.mangasGenre, mangasCategory: "Genre")
//            }else{
//              ForEach(categories, id: \.self){ category in
//                HorizontalScrollView(mangas: category.mangas, mangasCategory: category.name)
//              }
//            }
          }
        }
        .padding(.vertical)
        .task{
          do{
            try await mangaVM.loadListHome()
          } catch {
              print("Error: \(error)")
          }
        }
      }
    }
  }
}

#Preview {
  HomeView(mangaVM: HomeVM(networkService: MockDataTest()))
          
}
