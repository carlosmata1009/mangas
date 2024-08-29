//
//  CustomAsyncImage.swift
//  Mangas
//
//  Created by Carlos Mata on 8/27/24.
//

import SwiftUI

struct CustomAsyncImage: View{
  var url: String
  var width: CGFloat
  var height: CGFloat
  
  var body: some View{
    asyncImage(url: url, width: width, height: height)
  }
  private func asyncImage(url: String, width: CGFloat, height: CGFloat)-> some View{
    AsyncImage(url: URL(string: url)){ phase in
      switch phase{
      case .failure:
        Image("NotFound")
          .resizable()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width:  width, height: height)
          .shadow(radius: 2)
      case .success(let image):
        image
          .resizable()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: width, height: height)
          .shadow(radius: 2)
      default:
        RoundedRectangle(cornerRadius: 8)
          .frame(width: width, height: height)
          .foregroundStyle(.gray)
          .opacity(0.2)
          .shadow(radius: 2)
          .overlay{
            VStack{
              ProgressView()
                .tint(.white)
            }
          }
      }
    }
  }
}
#Preview{
  CustomAsyncImage(url:  String(Items.itemTest.cleanedURLMainPicture), width: 90, height: 120)
}
