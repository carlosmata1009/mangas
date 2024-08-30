//
//  HomeView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  @Environment(\.modelContext) private var context
  @State var mangaVM: HomeVM = HomeVM()
  @State var searchText = ""
  @Query var mangaCategories: [MangaCategory]
  
  var body: some View {
    
    NavigationStack{
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea(.all)
        VStack{
          PortadaView()
            .padding(.vertical)
          ScrollView{
            if mangaCategories.isEmpty{
              HorizontalScrollView(mangas: mangaVM.mangasAll, mangasCategory: "All Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasBest, mangasCategory: "Best Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasAuthor, mangasCategory: "Author")
              HorizontalScrollView(mangas: mangaVM.mangasDemographic, mangasCategory: "Demographics")
              HorizontalScrollView(mangas: mangaVM.mangasTheme, mangasCategory: "Themes")
              HorizontalScrollView(mangas: mangaVM.mangasGenre, mangasCategory: "Genre")
            }else{
              ForEach(mangaCategories, id: \.self){ mang in
                HorizontalScrollView(mangas: mang.mangas.sorted(by: Manga.byScore), mangasCategory: mang.name)
              }
            }
          }
        }
        .padding(.vertical, 5)
        .task{
          if mangaCategories.isEmpty{
            do{
              try await mangaVM.loadListHome()
              try await Task.sleep(nanoseconds: 5 * 1_000_000_000)
              saveMangaCategories()
            } catch {
              print("Error: \(error)")
            }
          }else{
            print("Guardado")
          }
        }
      }
    }
  }
  private func saveMangaCategories(){
    context.insert(MangaCategory(name: "All Mangas", mangas: mangaVM.mangasAll))
    context.insert(MangaCategory(name: "Best Mangas", mangas: mangaVM.mangasBest))
    context.insert(MangaCategory(name: "Author", mangas: mangaVM.mangasAuthor))
    context.insert(MangaCategory(name: "Demographics", mangas: mangaVM.mangasDemographic))
    context.insert(MangaCategory(name: "Themes", mangas: mangaVM.mangasTheme))
    context.insert(MangaCategory(name: "Genre", mangas: mangaVM.mangasGenre))
 }
}

#Preview {
  HomeView()
    .modelContainer(.preview)
}
