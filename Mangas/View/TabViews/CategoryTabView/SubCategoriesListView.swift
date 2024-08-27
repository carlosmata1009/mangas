//
//  CategoriesView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/21/24.
//

import SwiftUI

struct SubCategoriesListView: View {
  var categoryName: String
  var categoryVM: CategoryVM
  var categories: [String]
  var body: some View {
    NavigationStack {
      ZStack {
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack{
          ScrollView(){
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
              ForEach(categories, id: \.self){ name in
                NavigationLink{
                  MangasByCategory(categoryVM: categoryVM, category: categoryName, subcategory: name)
                }label: {
                  ButtonSubCategories(subCategoryName: name)
                }
              }
            }
          }.padding(.all, 10)
        }
      }
    }
  }
}
#Preview {
  SubCategoriesListView(categoryName: "Genre", categoryVM: CategoryVM(networkService: MockDataTest()), categories: ["Comedy", "Sci-Fi", "Adventure", "Action", "Supernatural", "Drama", "Award Winning", "Slice of Life", "Scienceww", "Sc", "Scence", "Science", "S"])
}
