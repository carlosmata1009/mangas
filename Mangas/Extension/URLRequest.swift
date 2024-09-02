//
//  URLRequest.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation

extension URLRequest{
  static func get(url: URL) throws -> URLRequest{
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    return request
  }
  static func post(url: URL) throws -> URLRequest{
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    return request
  }
}

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/")!

extension URL{
  static let getAuthors = api.appending(path: "list/authors")
  static let getThemeCategories = api.appending(path: "list/themes")
  static let getDemographicCategories = api.appending(path:"list/demographics")
  static let getGenreCategories = api.appending(path: "list/genres")
  
  static func filterMangaByContains(word: String)async throws-> URL{
    let query = "page=\(1)&per=\(1000)"
    let url = "\(api)search/mangasContains/\(word)?/\(query)"
    guard let url = URL(string: url) else{
      throw URLError(.badURL)
    }
    return url
  }
  static func filterMangaByBegins(word: String)-> URL{
    return api.appending(path: "search/mangasBeginsWith/\(word)")
  }
  
  static func getMangasSubByCategory(category: String, subCategory: String, page: Int?, per: Int?) async throws -> URL{
    if let page = page, let per = per{
      let query = "page=\(page)&per=\(per)"
      let url = "\(api)list/mangaBy\(category)/\(subCategory)?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }else{
      let url = "\(api)list/mangaBy\(category)/\(subCategory)"
      guard let url = URL(string: url)else{
        throw URLError(.badURL)
      }
      return url
    }
  }
  static func getMangaList(page: Int? , per: Int?)async throws-> URL{
    if let page = page, let per = per{
      let query = "page=\(page)&per=\(per)"
      let url = "\(api)list/mangas?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
     }
      return url
    }
    guard let url = URL(string: "\(api)list/mangas")else{
      throw URLError(.badURL)
    }
    return url
  }
  static func getBestMangaList(page: Int?, per: Int?)async throws-> URL{
    if let page = page, let per = per{
      let query = "page=\(page)&per=\(per)"
      let url = "\(api)list/bestMangas?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
    guard let url = URL(string: "\(api)list/bestMangas")else{
      throw URLError(.badURL)
    }
    return url
  }
}
