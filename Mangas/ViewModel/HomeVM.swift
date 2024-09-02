//
//  MangaVM.swift
//  Mangas
//
//  Created by Carlos Mata on 8/14/24.
//

import Foundation
import SwiftData

@Observable
class HomeVM{
  private let networkService: NetworkProtocol
  
  var mangasAll: [Manga] = []
  var mangasBest: [Manga] = []
  var mangasTheme: [Manga] = []
  var mangasDemographic: [Manga] = []
  var mangasAuthor: [Manga] = []
  var mangasGenre: [Manga] = []
  var mangaPortada: [Manga] = []
  init(networkService: NetworkProtocol = NetworkService.shared) {
    self.networkService = networkService
  }
  func getImagesPortadaRandom() async throws{
    Task{
      do{
        mangaPortada = try await networkService.getImagesForPortada(page: Int.random(in: 1...12967), per: 5).items
      }catch{
        print(error)
      }
    }
  }
  func loadListHome()async throws{
    Task{
      do{
        mangasAll = try await networkService.getMangaList(page: nil, per: 15).items.sorted()
        mangasBest = try await networkService.getBestMangaList(page: nil, per: 15).items.sorted(by: Manga.byScore)
        mangasAuthor = try await networkService.getMangasByCategory(category: "Author", subcategory: "998C1B16-E3DB-47D1-8157-8389B5345D03", page: nil, per: 15).items.sorted()
        mangasDemographic = try await networkService.getMangasByCategory(category: "Demographic", subcategory: "Seinen", page: nil, per: 15).items.sorted()
        mangasTheme = try await networkService.getMangasByCategory(category: "Theme", subcategory: "school", page: nil, per: 15).items.sorted()
        mangasGenre = try await networkService.getMangasByCategory(category: "Genre", subcategory: "romance", page: nil, per: 15).items.sorted()
      }catch{
        print(error)
      }
    }
  }
}

