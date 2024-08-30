//
//  CategoryVM.swift
//  Mangas
//
//  Created by Carlos Mata on 8/27/24.
//

import Foundation

@Observable
class CategoryVM{
  private let networkService: NetworkProtocol
  
  var mangasGenres: [String] = []
  var mangaDemographics: [String] = []
  var mangaAuthors: [Author] = []
  var mangaThemes: [String] = []
  var mangas: [Manga] = []
  var totalMangas = 0 {
    didSet{
      calculatePaginated()
    }
  }
  var numberPages = 0
  var page: Int = 1
  var per: Int = 12{
    didSet{
      calculatePaginated()
    }
  }
  
  init(networkService: NetworkProtocol = NetworkService.shared) {
    self.networkService = networkService
  }
  func calculatePaginated(){
    numberPages = Int(ceil(Double(totalMangas) / Double(per)))
  }
  func loadMangasBySubCategory(category: String, subCategory: String)async throws{
    Task{
      do{
        mangas = try await networkService.getMangasByCategory(category: category, subcategory: subCategory, page: page, per: per).items
        totalMangas = try await networkService.getMangasByCategory(category: category, subcategory: subCategory, page: page, per: per).metadata.total
      }catch{
        print(error)
      }
    }
  }
  
  func fetchAllSubcategories(){
    Task{
      do{
        //mangaAuthors = try await networkService.getAuthors()
        mangaThemes = try await networkService.getThemes()
        mangaDemographics = try await networkService.getDemographics()
        mangasGenres = try await networkService.getGenres()
      }catch{
        print(error)
      }
    }
  }
}
