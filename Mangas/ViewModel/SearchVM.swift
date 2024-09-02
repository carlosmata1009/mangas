//
//  SearchVM.swift
//  Mangas
//
//  Created by Carlos Mata on 8/30/24.
//

import Foundation

@Observable
class SearchVM{
  private var networkService: NetworkProtocol
  var searchSelection: Int = 1
  var searchText: String = ""
  var mangas: [Manga] = []
  
  
  init(networkService: NetworkProtocol = NetworkService()) {
    self.networkService = networkService
  }
 
  var searchTask: Task<Void, Never>?

  func search(word: String) async throws{
    searchTask?.cancel()
    searchTask = nil

    searchTask = Task { @MainActor in
      do {
        try await Task.sleep(for: .milliseconds(400))
          if(searchSelection == 1){
            mangas = try await networkService.getMangasByFilterContain(word: word).items
          }else{
            mangas = try await networkService.getMangasByFilterBegin(word: word)
          }
      }catch{
        print(error)
      }
    }
  }
}
