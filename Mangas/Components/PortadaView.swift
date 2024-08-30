//
//  PortadaView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/28/24.
//

import SwiftUI

struct PortadaView: View {
  @Binding var indexOfImage: Int
  var mangas: [Manga]
  
  var body: some View {
    VStack {
        TabView(selection: $indexOfImage) {
          ForEach(mangas) { manga in
            VStack {
              NavigationLink{
                MangaDetail(manga: manga)
              }label: {
                CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 350, height: 400)
                .overlay{
                  LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear, Color.clear, Color.black.opacity(0.3)]),
                      startPoint: .top,
                      endPoint: .bottom
                  )
                }
              }
            }
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 400)
    }
  }
}

#Preview {
  VStack{
    PortadaView( indexOfImage: .constant(1), mangas: Items.itemsTest.items)
  }
}
