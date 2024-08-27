//
//   MangaDetail.swift
//  Mangas
//
//  Created by Carlos Mata on 8/18/24.
//

import SwiftUI

struct MangaDetail: View {
  var manga: Manga
  var body: some View {
    
    VStack(alignment: .leading){
      HStack{
        Spacer()
        CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 150, height: 180)
        Spacer()
      }
      
      Text(manga.sypnosis)
        .font(.subheadline)
        .foregroundStyle(.white)
      Spacer()
      
    }
    .padding()
    .background(Color("BackgroundColor"))
  }
}

#Preview {
  MangaDetail(manga: Items.itemTest)
}
