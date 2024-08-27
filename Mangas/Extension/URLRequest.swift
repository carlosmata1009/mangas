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
}

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/list/")!

extension URL{
  static func getMangaByCategory(category: String, subCategory: String, page: Int?, per: Int?) async throws -> URL{
    let url = "\(api)mangaBy\(category)/\(subCategory)"
    guard let url = URL(string: url)else{
      throw URLError(.badURL)
    }
    return url
  }
  static let getAuthors = api.appending(path: "authors")
  static let getThemeCategories = api.appending(path: "themes")
  static let getDemographicCategories = api.appending(path:"demographics")
  static let getGenreCategories = api.appending(path: "genres")
  static func getMangaList(page: Int? = nil, per: Int? = 10)async throws-> URL{
    if let page = page, let per = per{
      let query = "page=\(page)&per=\(per)"
      let url = "\(api)/mangas?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
     }
      return url
    }
    guard let url = URL(string: "\(api)/mangas")else{
      throw URLError(.badURL)
    }
    return url
  }
  static func getBestMangaList(page: Int?, per: Int?)async throws-> URL{
    if let page = page, let per = per{
      let query = "page=\(page)&per=\(per)"
      let url = "\(api)/bestMangas?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
    guard let url = URL(string: "\(api)/bestMangas")else{
      throw URLError(.badURL)
    }
    return url
  }
  static func getThemeMangaList(page: Int?, per: Int?)async throws-> URL{
    if(page == nil && per == nil){
      guard let url = URL(string: "\(api)/mangaByTheme/school")else{
        throw URLError(.badURL)
      }
      return url
    }else{
      let query = "page=\(page ?? 0)&per=\(per ?? 0)"
      let url = "\(api)/mangaByTheme/school?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
  }
  static func getGenreMangaList(page: Int?, per: Int?)async throws-> URL{
    if(page == nil && per == nil){
      guard let url = URL(string: "\(api)/mangaByGenre/romance")else{
        throw URLError(.badURL)
      }
      return url
    }else{
      let query = "page=\(page ?? 0)&per=\(per ?? 0)"
      let url = "\(api)/mangaByGenre/romance?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
  }
  static func getDemographicMangaList(page: Int?, per: Int?)async throws-> URL{
    if(page == nil && per == nil){
      guard let url = URL(string: "\(api)/mangaByDemographic/Seinen")else{
        throw URLError(.badURL)
      }
      return url
    }else{
      let query = "page=\(page ?? 0)&per=\(per ?? 0)"
      let url = "\(api)/mangaByDemographic/Seinen?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
  }
  static func getAuthorMangaList(page: Int?, per: Int?)async throws-> URL{
    if(page == nil && per == nil){
      guard let url = URL(string: "\(api)/mangaByAuthor/998C1B16-E3DB-47D1-8157-8389B5345D03")else{
        throw URLError(.badURL)
      }
      return url
    }else{
      let query = "page=\(page ?? 0)&per=\(per ?? 0)"
      let url = "\(api)/mangaByAuthor/998C1B16-E3DB-47D1-8157-8389B5345D03?\(query)"
      guard let url = URL(string: url) else{
        throw URLError(.badURL)
      }
      return url
    }
  }
}
