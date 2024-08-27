//
//  MangasByCategory.swift
//  Mangas
//
//  Created by Carlos Mata on 8/22/24.
//

import SwiftUI

struct MangasByCategory: View {
  var categoryVM: CategoryVM
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
                }label: {
                  MangaSubcategoryGridView(manga: manga)
                }
              }
            }
          }
          .navigationTitle(subcategory)
          .task {
            do{
              try await categoryVM.loadMangasBySubCategory(category: category, subCategory: subcategory.lowercased(), page: nil, per: nil)
            }catch{
              print(error)
            }
          }
          .padding()
        }
        .toolbar{
          ToolbarItem(placement: .primaryAction) {
            Picker("", selection: $selection) {
              Text("12 mangas").tag(12)
              Text("24 mangas").tag(24)
              Text("36 mangas").tag(36)
              Text("48 mangas").tag(48)
              Text("60 mangas").tag(60)
            }
            .pickerStyle(.automatic)
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
