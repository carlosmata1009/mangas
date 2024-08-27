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
        mangasAll = try await networkService.getMangaList(page: nil, per: 15).items
        mangasBest = try await networkService.getBestMangaList(page: nil, per: 15).items
        mangasTheme = try await networkService.getThemeMangaList(page: nil, per: 15).items
        mangasDemographic = try await networkService.getDemographicMangaList(page: nil, per: 15).items
        mangasAuthor = try await networkService.getAuthorMangaList(page: nil, per: 15).items
        mangasGenre = try await networkService.getGenreMangaList(page: nil, per: 15).items
      }catch{
        print(error)
      }
    }
  }
}
