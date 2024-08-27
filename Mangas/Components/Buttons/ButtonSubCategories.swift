//
//  ButtonCategory.swift
//  Mangas
//
//  Created by Carlos Mata on 8/19/24.
//

import SwiftUI

struct ButtonSubCategories: View {
  var subCategoryName: String

  var body: some View {
    VStack{
      Image("\(subCategoryName.lowercased())")
      .resizable()
      .frame(width: 180, height: 110)
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .opacity(0.8)
      .overlay(
        VStack{
          Spacer()
          HStack{
            Text(subCategoryName)
              .foregroundStyle(.white)
              .font(.title3)
              .bold()
              .padding([.bottom, .leading], 5)
            Spacer()
          }
        }
      )   
    }
  }
}

#Preview {
  ButtonSubCategories(subCategoryName: "Comedy")
  
}
