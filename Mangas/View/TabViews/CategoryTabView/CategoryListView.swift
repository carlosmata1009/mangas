//
//  CategoryView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI

struct CategoryListView: View {
  @State var categoryVM: CategoryVM = CategoryVM()
  
  var body: some View {
    NavigationStack {
      ZStack{
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack{
          ScrollView{
            NavigationLink{
              SubCategoriesListView(categoryName: "Author", categoryVM: categoryVM, categories: categoryVM.mangaAuthors.map{$0.firstName})
                .navigationTitle("Authors")
            }label: {
              ButtonCategory(categoryName: "Authors")
            }
            NavigationLink{
              SubCategoriesListView(categoryName: "Demographic", categoryVM: categoryVM, categories: categoryVM.mangaDemographics.sorted())
                .navigationTitle("Demographics")
            }label: {
              ButtonCategory(categoryName: "Demographics")
            }
            NavigationLink{
              SubCategoriesListView(categoryName: "Genre", categoryVM: categoryVM, categories: categoryVM.mangasGenres.sorted())
                .navigationTitle("Genres")
            }label: {
              ButtonCategory(categoryName: "Genres")
            }
            NavigationLink{
              SubCategoriesListView(categoryName: "Theme", categoryVM: categoryVM, categories: categoryVM.mangaThemes.sorted())
                .navigationTitle("Themes")
            }label: {
              ButtonCategory(categoryName: "Themes")
            }
          }.padding(.vertical, 5)
        }
      }
      .navigationTitle("Categories")
      .task{
        categoryVM.fetchAllSubcategories()
      }
    }
  }
}

#Preview {
  CategoryListView(categoryVM: CategoryVM(networkService: MockDataTest()))
}
