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
  @State var swiftDataVM: SwiftDataVM
  init(modelContext: ModelContext) {
    let viewModel = SwiftDataVM(context: modelContext)
    _swiftDataVM = State(initialValue: viewModel)
  }
  var body: some View {
    
    NavigationStack{
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea(.all)
        
        VStack{
          PortadaView()
            .padding(.vertical)
          ScrollView{
            
            if $swiftDataVM.mangaCategories.isEmpty{
              HorizontalScrollView(mangas: mangaVM.mangasAll, mangasCategory: "All Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasBest, mangasCategory: "Best Mangas")
              HorizontalScrollView(mangas: mangaVM.mangasAuthor, mangasCategory: "Author")
              HorizontalScrollView(mangas: mangaVM.mangasDemographic, mangasCategory: "Demographics")
              HorizontalScrollView(mangas: mangaVM.mangasTheme, mangasCategory: "Themes")
              HorizontalScrollView(mangas: mangaVM.mangasGenre, mangasCategory: "Genre")
            }else{
              ForEach(swiftDataVM.mangaCategories, id: \.self){ mang in
                HorizontalScrollView(mangas: mang.mangas.sorted(by: Manga.byScore), mangasCategory: mang.name)
              }
            }
          }
        }
        .padding(.vertical, 5)
        .task{
          if swiftDataVM.mangaCategories.isEmpty{
            do{
              try await mangaVM.loadListHome()
              try await Task.sleep(nanoseconds: 5 * 1_000_000_000)
              try swiftDataVM.saveInSwiftData(name: "All Mangas", mangas: mangaVM.mangasAll)
              try swiftDataVM.saveInSwiftData(name: "Best Mangas", mangas: mangaVM.mangasBest)
              try swiftDataVM.saveInSwiftData(name: "Author", mangas: mangaVM.mangasAuthor)
              try swiftDataVM.saveInSwiftData(name: "Demographics", mangas: mangaVM.mangasDemographic)
              try swiftDataVM.saveInSwiftData(name: "Themes", mangas: mangaVM.mangasTheme)
              try swiftDataVM.saveInSwiftData(name: "Genre", mangas: mangaVM.mangasGenre)
              
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
  
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: MangaCategory.self, configurations: config)
    return HomeView(modelContext: container.mainContext)
  } catch {
    fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
  }
}
