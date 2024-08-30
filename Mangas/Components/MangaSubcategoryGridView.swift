//
//  Manga.swift
//  Mangas
//
//  Created by Carlos Mata on 8/23/24.
//

import SwiftUI

struct MangaSubcategoryGridView: View {
  var manga: Manga
  var body: some View {
    VStack{
      CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 110, height: 150)
      VStack{
        HStack{
          Text(manga.title)
            .foregroundStyle(.white)
            .font(.headline)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .frame(width: 90, height: 50)
        }
      }
    }.padding(.vertical, 8)
  }
}

#Preview {
  ZStack{
    Color("BackgroundColor")
      .ignoresSafeArea()
    VStack{
      MangaSubcategoryGridView(manga: Items.itemTest)
    }
  }
}
