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
        asyncImage(url: manga.cleanedURLMainPicture)
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

private func asyncImage(url: String)-> some View{
  AsyncImage(url: URL(string: url)){ phase in
    switch phase{
      case .failure:
        Image(systemName: "house")
      case .success(let image):
        image
          .resizable()
          .scaledToFit()
      
          .shadow(radius: 2)
      default:
        ProgressView()
    }
  }
}
#Preview {
  MangaDetail(manga: Items.itemsTest.items.first!)
}
