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
  @Query private var mangaCategory: [MangaCategory]
  var body: some View {
    NavigationStack{
      ZStack{
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 10){
          ScrollView{
            if((mangaCategory.filter{$0.name == "MyMangas"}).isEmpty){
              Text("None Favorites yet, add somehting first")
                .foregroundStyle(.white)
            }else{
              ForEach(mangaCategory.filter{$0.name == "MyMangas"}, id: \.self){mangaCategory in
                ForEach(mangaCategory.mangas, id: \.id){manga in
                  NavigationLink{
                    MangaDetail(manga: manga)
                  }label:{
                    MangaFavoriteRowItem(manga: manga)
                  }
                }
              }
            }
          }.padding()
        }
      }
    }
  }    
}

#Preview {
  FavoriteView()
    .modelContainer(.preview)
}
