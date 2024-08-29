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
  
  init(networkService: NetworkProtocol = NetworkService.shared) {
          self.networkService = networkService
  }
  
  func loadListHome()async throws{
    Task{
      do{
        mangasAll = try await networkService.getMangaList(page: 1, per: 15).items.sorted()
        mangasBest = try await networkService.getBestMangaList(page: nil, per: 15).items.sorted(by: Manga.byScore)
        mangasTheme = try await networkService.getThemeMangaList(page: nil, per: 15).items.sorted()
        mangasDemographic = try await networkService.getDemographicMangaList(page: nil, per: 15).items.sorted()
        mangasAuthor = try await networkService.getAuthorMangaList(page: nil, per: 15).items.sorted()
        mangasGenre = try await networkService.getGenreMangaList(page: nil, per: 15).items.sorted()
      }catch{
        print(error)
      }
    }
  }
}

