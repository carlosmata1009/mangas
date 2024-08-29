//
//  PortadaView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/28/24.
//

import SwiftUI

struct PortadaView: View {
  @State var indexOfImage: Int = 0
  
  var body: some View {
    ZStack{
      Color("BackgroundColor")
          .ignoresSafeArea()
      VStack{
        TabView(selection: $indexOfImage){
          ForEach(1..<6, id: \.self){ index in
            switch index{
            case 1:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            case 2:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            case 3:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            case 4:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            case 5:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            case 6:
              NavigationLink{
                
              }label: {
                Image("\(index)")
                  .resizable()
                  .frame(width: 400, height: 300)
                  .shadow(radius: 2)
              }
            default:
              Image("NotFound")
                .resizable()
                .frame(width: 400, height: 300)
                .shadow(radius: 2)
            }
            
          }
        }.tabViewStyle(.page)
      }
    }
  }
}

#Preview {
  ZStack{
      Color(uiColor: .blue)
          .ignoresSafeArea()
      VStack{
          PortadaView( indexOfImage: 1)
      }
  }
}
