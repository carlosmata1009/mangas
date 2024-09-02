//
//  SearchView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/26/24.
//

import SwiftUI

struct SearchView: View {
  @State var searchVM: SearchVM
  
  var body: some View { 
    NavigationStack {
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack {
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]){
              ForEach(searchVM.mangas, id: \.id){manga in
                NavigationLink{
                  MangaDetail( manga: manga)
                }label:{
                  MangaItem(manga: manga, lineLimit: 1)
                }
              }
            }

          }
          Spacer()
        }.padding()
          .toolbar{
            ToolbarItem(placement: .primaryAction) {
              Picker("",selection: $searchVM.searchSelection) {
                Text("Contains word").tag(1)
                Text("Begins with").tag(2)
              }.pickerStyle(.automatic)
            }
          }
      }.searchable(text: $searchVM.searchText)
        .onChange(of: searchVM.searchText){
          Task{
            try await searchVM.search(word: searchVM.searchText)
          }
        }
        .onChange(of: searchVM.searchSelection){
          searchVM.searchText = ""
          searchVM.mangas = []
        }
    }
  }
}

#Preview {
  SearchView(searchVM: SearchVM(networkService: MockDataTest()))
}
