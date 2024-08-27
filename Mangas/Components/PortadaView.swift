//
//  PortadaView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/19/24.
//

import SwiftUI

struct PortadaView: View {
  @Binding var images: [Manga]
      
  let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
  var body: some View {
    
      ScrollView(.horizontal){
        HStack{
          ForEach(images){ image in
            CustomAsyncImage(url: image.cleanedURLMainPicture, width: 400, height: 550)
              .background(.ultraThinMaterial)
              .opacity(0.7)
          }
        }
      }
      Spacer()
  }
}

#Preview {
  PortadaView(images: .constant(Items.itemsTest.items))
}
