//
//  MangaItem.swift
//  Mangas
//
//  Created by Carlos Mata on 8/13/24.
//

import SwiftUI

struct MangaScrollItemView: View {
  var manga: Manga
  
  var body: some View {
    VStack{
      CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 110, height: 150)
      VStack{
        HStack{
          Text(manga.title)
            .foregroundStyle(.white)
            .font(.subheadline)
            .lineLimit(1)
            .multilineTextAlignment(.leading)
            .frame(width: 90, alignment: .center)
        }
      }
    }.padding(.vertical, 8)
  }
}

#Preview {
  MangaScrollItemView(manga: Items.itemTest)
}
