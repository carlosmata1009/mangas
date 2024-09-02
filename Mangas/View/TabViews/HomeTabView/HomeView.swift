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
  @State private var indexOfImage = 1
  @State var chargePortada = true
  var body: some View {
    
    NavigationStack{
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea(.all)
        ScrollView{
          VStack{
            PortadaView(indexOfImage: $indexOfImage, mangas: mangaVM.mangaPortada)
              if mangaCategories.isEmpty{
                HorizontalScrollView(mangas: mangaVM.mangasAll, mangasCategory: "All Mangas")
                HorizontalScrollView(mangas: mangaVM.mangasBest, mangasCategory: "Best Mangas")
                HorizontalScrollView(mangas: mangaVM.mangasAuthor, mangasCategory: "Toriyama Akira")
                HorizontalScrollView(mangas: mangaVM.mangasDemographic, mangasCategory: "Seinen")
                HorizontalScrollView(mangas: mangaVM.mangasTheme, mangasCategory: "School")
                HorizontalScrollView(mangas: mangaVM.mangasGenre, mangasCategory: "Romance")
              }else{
                ForEach(mangaCategories.sorted(), id: \.self){ mangaCategory in
                  if mangaCategory.name == "MyMangas"{}else{
                    HorizontalScrollView(mangas: mangaCategory.mangas.sorted(by: Manga.byScore), mangasCategory: mangaCategory.name)
                  }
              }
            }
          }
        }
        .padding(.bottom, 3)
        .task{
          do{
            if chargePortada == true{
              try await mangaVM.getImagesPortadaRandom()
              chargePortada = false
            }
          }catch{
            print(error)
          }
          if mangaCategories.isEmpty || mangaCategories.first.map({$0.mangas.isEmpty}) == true{
            do{
              try await mangaVM.loadListHome()
              try await Task.sleep(nanoseconds: 4 * 1_000_000_000)
              saveMangaCategories()
            } catch {
              print("Error: \(error)")
            }
          }
        }
      }
    }
  }
  private func saveMangaCategories(){
    context.insert(MangaCategory(name: "All Mangas", mangas: mangaVM.mangasAll))
    context.insert(MangaCategory(name: "Best Mangas", mangas: mangaVM.mangasBest))
    context.insert(MangaCategory(name: "Toriyama Akira", mangas: mangaVM.mangasAuthor))
    context.insert(MangaCategory(name: "Seinen", mangas: mangaVM.mangasDemographic))
    context.insert(MangaCategory(name: "School", mangas: mangaVM.mangasTheme))
    context.insert(MangaCategory(name: "Romance", mangas: mangaVM.mangasGenre))
 }
}

#Preview {
  HomeView()
    .modelContainer(.preview)
}
