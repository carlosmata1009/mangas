//
//  detailsAbout.swift
//  Mangas
//
//  Created by Carlos Mata on 8/29/24.
//

import SwiftUI

struct AboutMangaDetailsComponent: View {
  var name: String
  var manga: Manga
    var body: some View {
      VStack{
        HStack{
          Text(name)
          Spacer()
          detail(name: name, manga: manga)
        }
      }.font(.subheadline)
    }
  private func detail(name: String, manga: Manga)-> some View{
    Group{
      switch name{
      case "Demographics":
        if (manga.demographics.count != 1 && manga.demographics.count != 0){
          let demographics = manga.demographics.dropLast()
          let last = manga.demographics.removeLast()
          HStack{
            ForEach(demographics, id: \.id){ demographic in
                Text("\(demographic.demographic),")
            }
            Text("\(last.demographic)")
          }
        }else{
          ForEach(manga.demographics, id: \.id){ demographic in
            HStack{
              Text(demographic.demographic)
            }
          }
        }
      case "Authors":
        if (manga.authors.count != 1 && manga.authors.count != 0){
          let authors = manga.authors.dropLast()
          let last = manga.authors.removeLast()
          HStack{
            ForEach(authors, id: \.id){ author in
                Text("\(author.firstName),")
            }
            Text("\(last.firstName)")
          }
        }else{
          ForEach(manga.authors, id: \.id){ author in
            HStack{
              Text(author.firstName)
            }
          }
        }
      case "Genres":
        if (manga.genres.count != 1 && manga.genres.count != 0){
          let genres = manga.genres.dropLast()
          let last = manga.genres.removeLast()
          
            HStack{
              ForEach(genres, id: \.id){ genre in
                Text("\(genre.genre),")
              }
              Text("\(last.genre)")
            }
          
        }else{
          ForEach(manga.genres, id: \.id){ genre in
            HStack{
              Text(genre.genre)
            }
          }
        }
      case "Themes":
        if (manga.themes.count != 1 && manga.themes.count != 0){
          let themes = manga.themes.dropLast()
          let last = manga.themes.removeLast()
          
            HStack{
              ForEach(themes, id: \.id){ theme in
                Text("\(theme.theme),")
              }
              Text("\(last.theme)")
            }
        }else{
          ForEach(manga.themes, id: \.id){ theme in
            HStack{
              Text(theme.theme)
            }
          }
        }
      default:
        EmptyView()
      }
    }
  }
}

#Preview {
  AboutMangaDetailsComponent(name: "Demographics", manga: Items.itemTest)
}
