//
//  SwiftDataVM.swift
//  Mangas
//
//  Created by Carlos Mata on 8/28/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
final class SwiftDataVM{
  var context: ModelContext
  var mangaCategories: [MangaCategory] = []

  init(context: ModelContext) {

    self.context = context
    fetchMangaCategories()
  }
  func fetchMyMangas()-> MangaCategory{

    return mangaCategories.first(where: { $0.name == "MyMangas" }) ?? MangaCategory(name: "MyMangas", mangas: [])
  }
  func fetchMangaCategories(){
    do{
      let descriptor = FetchDescriptor<MangaCategory>()
      mangaCategories = try context.fetch(descriptor)
    }catch{
      print("Fetch failed")
    }
  }
  
  func saveInSwiftData(name: String, mangas: [Manga]) throws {
    let existingCategory = try context.fetch(FetchDescriptor<MangaCategory>(predicate: #Predicate { $0.name == name })).first
      
    if let category = existingCategory {
        category.mangas = mangas
    } else {
        let newCategory = MangaCategory(name: name, mangas: mangas)
      context.insert(newCategory)
    }
    do {
        try context.save()
    } catch {
        throw error
    }
  }
}
