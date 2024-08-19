//
//  MangaItem.swift
//  Mangas
//
//  Created by Carlos Mata on 8/13/24.
//

import SwiftUI

struct MangaItem: View {
  var manga: Manga
    var body: some View {
      VStack{
        asyncImage(url: manga.cleanedURLMainPicture)
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
  
  private func asyncImage(url: String)-> some View{
    AsyncImage(url: URL(string: url)){ phase in
      switch phase{
      case .failure:
        Image(systemName: "house")
      case .success(let image):
        image
          .resizable()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: 90, height: 120)
          .shadow(radius: 2)
      default:
        ProgressView()
      }
    }
  }
}

#Preview {
  MangaItem(manga: Items.itemsTest.items.first!)
    
}
