//
//  MangasByCategory.swift
//  Mangas
//
//  Created by Carlos Mata on 8/22/24.
//

import SwiftUI

struct MangasByCategory: View {
  @Environment(\.modelContext) private var context
  @State var categoryVM: CategoryVM
  var category: String
  var subcategory: String
  @State var selection: Int = 12
  var body: some View {
    NavigationStack{
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack{
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]){
              ForEach(categoryVM.mangas) { manga in
                NavigationLink{
                  MangaDetail( manga: manga)
                }label: {
                  MangaSubcategoryGridView(manga: manga)
                }
              }
            }
            ScrollView(.horizontal){
              HStack{
                ForEach(1..<categoryVM.numberPages + 1, id: \.self){ number in
                  Button{
                    categoryVM.page = number
                    Task{
                      try await categoryVM.loadMangasBySubCategory(category: category, subCategory: subcategory.lowercased())
                    }
                  }label:{
                    Text(String(number))
                      .font(.title)
                  }
                }.foregroundStyle(.white)
              }.padding()
            }
          }
          .navigationTitle(subcategory)
          .task {
            do{
              try await categoryVM.loadMangasBySubCategory(category: category, subCategory: subcategory.lowercased())
            }catch{
              print(error)
            }
          }
          .padding()
          
        }
        
        .toolbar{
          ToolbarItem(placement: .primaryAction) {
            Picker("", selection: $categoryVM.per) {
              Text("12 mangas").tag(12)
              Text("24 mangas").tag(24)
              Text("36 mangas").tag(36)
              Text("48 mangas").tag(48)
              Text("60 mangas").tag(60)
            }
            .pickerStyle(.automatic)
          }
        }.onChange(of: categoryVM.per){
          Task{
            try await categoryVM.loadMangasBySubCategory(category: category, subCategory: subcategory.lowercased())
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack{
    MangasByCategory(categoryVM: CategoryVM(networkService: MockDataTest()), category: "Genre", subcategory: "Comedy")
  }
}
