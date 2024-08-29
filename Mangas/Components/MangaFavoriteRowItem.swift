//
//  MangaFavoriteRowItem.swift
//  Mangas
//
//  Created by Carlos Mata on 8/29/24.
//

import SwiftUI

struct MangaFavoriteRowItem: View {
  var manga: Manga
  var body: some View {
    
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(alignment: .leading){
        HStack{
          CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 100, height: 140)
          VStack(alignment: .leading){
            Text(manga.title)
              .font(.headline)
              .bold()
            Text("Rating: \(manga.score)")
              .font(.headline)
              .bold()
          }.foregroundStyle(.white)
          Spacer()
        }
      }
    }
  }
}

#Preview {
  MangaFavoriteRowItem(manga: Items.itemTest)
}
