//
//  FavoriteMangaRow.swift
//  dadas
//
//  Created by Carlos Mata on 9/1/24.
//

import SwiftUI

struct FavoriteMangaRow: View {
  var manga: Manga

  var body: some View {    
    VStack {
      HStack{
        CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 100, height: 140)
        VStack(alignment: .leading, spacing: 5){
          HStack{
            Text(manga.title)
              .font(.headline)
              .foregroundColor(.white)
              .bold()
            Spacer()
            Text(String(manga.score))
              .padding()
              .background{
                Circle()
                .foregroundStyle(.yellow)
              }
              .foregroundStyle(.black)
          }
          HStack{
            Text(genresWhat(string: manga.genres.map{$0.genre}))
              .font(.caption)
              .foregroundStyle(.black)
          }
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(.gray)
        .opacity(0.7)
    )
    .padding()
  }
}
private func genresWhat(string: [String])-> String{
  var genres = ""
    for i in string{
      if(i == string.last){
        genres.append(i)
        return genres
      }
      genres.append("\(i)-")
    }
  return genres
}

#Preview{
  FavoriteMangaRow(manga: Items.itemTest)
    .padding()
    .background(Color("Color"))
}
