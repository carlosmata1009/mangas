//
//  MangaItem.swift
//  Mangas
//
//  Created by Carlos Mata on 8/13/24.
//

import SwiftUI

struct MangaItem: View {
  var manga: Manga
  var lineLimit: Int
  
  var body: some View {
    VStack{
      CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 110, height: 150)
      VStack{
        HStack{
          Text(manga.title)
            .foregroundStyle(.white)
            .font(.subheadline)
            .lineLimit(lineLimit)
            .multilineTextAlignment(.leading)
            .frame(width: 90, height: 50)
        }
      }
    }.padding(.vertical, 4)
  }
}

#Preview {
  MangaItem(manga: Items.itemTest, lineLimit: 1)
}
