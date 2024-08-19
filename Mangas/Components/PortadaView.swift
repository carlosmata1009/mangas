//
//  PortadaView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/19/24.
//

import SwiftUI

struct PortadaView: View {
  @Binding var images: [Manga]
  var body: some View {
    
      ScrollView(.horizontal){
        HStack{
          ForEach(images){ image in
            asyncImage(url: image.cleanedURLMainPicture)
          }
        }
      }
      Spacer()
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
            .frame(maxWidth: 400, maxHeight: 550)
            .shadow(radius: 2)
        default:
          ProgressView()
      }
    }
  }
}

#Preview {
  PortadaView(images: .constant(Items.itemsTest.items))
}
