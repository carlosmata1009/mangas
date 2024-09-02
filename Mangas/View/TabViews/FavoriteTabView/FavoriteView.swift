//
//  FavoriteView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
  @Environment(\.modelContext) private var context
  @Query(filter: #Predicate<MangaCategory> { $0.name == "MyMangas" }) private var myMangaCategory: [MangaCategory]
  var body: some View {
    NavigationStack{
      ZStack{
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 10){
          if myMangaCategory.isEmpty{
            Text("No Favorites yet, add something first")
              .foregroundStyle(.white)
              .padding()
          }else{
            List{
              ForEach(myMangaCategory, id: \.self){mangaCa in
                if mangaCa.name == "MyMangas"{
                  ForEach(mangaCa.mangas, id: \.id){manga in
                    NavigationLink{
                      MangaDetail(manga: manga)
                    }label:{
                      FavoriteMangaRow(manga: manga)
                    }
                    .buttonStyle(.plain)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .swipeActions {
                      Button(role: .destructive) {
                        Task{
                          deleteManga(id: manga.id)
                        }
                      } label: {
                        Label("Delete", systemImage: "trash")
                      }
                    }
                  }
                }
              }
            }
            .listStyle(.plain)
          }
        }
        .padding()
      }
    }
  }
  private func deleteManga(id: Int) {
   
    for category in myMangaCategory {
      if category.name == "MyMangas" {
        if let index = category.mangas.firstIndex(where: { $0.id == id }) {
          category.mangas.remove(at: index)
          do {
            try context.save()
            print("Deleted successfully")
          } catch {
            print("Failed to delete: \(error.localizedDescription)")
          }
        }
      }
    }
  }
}

#Preview {
  FavoriteView()
    .modelContainer(.preview)
}
