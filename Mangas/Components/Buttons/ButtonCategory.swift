//
//  ButtonCategory.swift
//  Mangas
//
//  Created by Carlos Mata on 8/21/24.
//

import SwiftUI

struct ButtonCategory: View {
  var categoryName: String
  var body: some View {
    VStack{
      Image("\(categoryName.lowercased())")
      .resizable()
      .frame(width: 350, height: 200)
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .opacity(1)
      .overlay(
        VStack{
          HStack{
            Text(categoryName)
              .foregroundStyle(.white)
              .font(.largeTitle)
              .bold()
              .padding([.bottom, .leading], 5)
            Spacer()
          }
          Spacer()
        }
      )
    }
  }
}

#Preview {
  ButtonCategory(categoryName: "Genres")
}
