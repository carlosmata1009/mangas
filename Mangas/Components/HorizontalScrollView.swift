//
//  HorizontalScrollView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/19/24.
//

import SwiftUI

struct HorizontalScrollView: View {
  @Binding var mangas: [Manga]
  var mangasCategory: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(mangasCategory)
        .font(.title2)
        .foregroundStyle(.white)
        .padding(.leading)
      ScrollView(.horizontal) {
        HStack() {
          ForEach(mangas, id: \.id) { manga in
            NavigationLink{
              MangaDetail(manga: manga)
            }label: {
              MangaItem(manga: manga)
            }
          }
        }.padding(.leading, 6)
      }
    }
  }
}

#Preview {
  HorizontalScrollView(mangas: .constant(Items.itemsTest.items), mangasCategory: "All Mangas")
}

