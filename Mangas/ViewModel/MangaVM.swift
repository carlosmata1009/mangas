//
//  MangaVM.swift
//  Mangas
//
//  Created by Carlos Mata on 8/14/24.
//

import Foundation

@Observable
class MangaVM{
  private let networkService: NetworkProtocol
  @MainActor var mangasAll: [Manga] = []
  @MainActor var mangasBest: [Manga] = []
  @MainActor var mangasTheme: [Manga] = []
  @MainActor var mangasDemographic: [Manga] = []
  @MainActor var mangasAuthor: [Manga] = []
  @MainActor var mangasGenre: [Manga] = []
  init(networkService: NetworkProtocol = NetworkService.shared) {
    self.networkService = networkService
    loadList()
  }
  
  func loadList(){
    Task{ @MainActor in
      do{
        mangasAll = try await networkService.getMangaList(page: nil, per: nil).items
        mangasBest = try await networkService.getBestMangaList(page: nil, per: nil).items
        mangasTheme = try await networkService.getThemeMangaList(page: nil, per: nil).items
        mangasDemographic = try await networkService.getDemographicMangaList(page: nil, per: nil).items
        mangasAuthor = try await networkService.getAuthorMangaList(page: nil, per: nil).items
        mangasGenre = try await networkService.getGenreMangaList(page: nil, per: nil).items
      }catch{
        print(error)
      }
    }
  }
//  func loadListPagePer(page: Int, per: Int){
//    Task{ @MainActor
//      do{
//        mangas = try await networkService.getMangaList(page: page, per: per).items
//      }catch{
//        print(error)
//      }
//    }
//  }
}
