//
//  MangasViewModel.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation

@Observable
class NetworkService: NetworkProtocol{

  static let shared = NetworkService()
  
  func getMangasByFilterBegin(word: String) async throws -> [Manga] {
    try await fetchCategories(request: .get(url: .filterMangaByBegins(word: word)), response: Manga.self)
  }
  
  func getMangasByFilterContain(word: String, page: Int, per: Int) async throws -> Items {
    try await perform(request: .get(url: .filterMangaByContains(word: word)))
  }
  
  func getMangasByCategory(category: String, subcategory: String, page: Int?, per: Int?) async throws -> Items {
    try await perform(request: .get(url: .getMangaByCategory(category: category, subCategory: subcategory, page: page, per: per)))
  }
  
  func getThemes() async throws -> [String] {
    try await fetchCategories(request: .get(url: .getThemeCategories), response: String.self)
  }
  
  func getAuthors() async throws -> [Author] {
    try await fetchCategories(request: .get(url: .getAuthors), response: Author.self)
  }
  
  func getDemographics() async throws -> [String] {
    try await fetchCategories(request: .get(url: .getDemographicCategories), response: String.self)
  }
  
  func getGenres() async throws -> [String] {
    try await fetchCategories(request: .get(url: .getGenreCategories), response: String.self)
  }
  
  func getGenreMangaList(page: Int?, per: Int? = 10) async throws -> Items {
    try await perform(request: .get(url: .getGenreMangaList(page: page, per: per)))
  }
  
  func getBestMangaList(page: Int?, per: Int? = 10) async throws -> Items {
    try await perform(request: .get(url: .getBestMangaList(page: page, per: per)))
  }
  
  func getThemeMangaList(page: Int?, per: Int? = 10) async throws -> Items {
    try await perform(request: .get(url: .getThemeMangaList(page: page, per: per)))
  }
  
  func getDemographicMangaList(page: Int?, per: Int? = 10) async throws -> Items {
    try await perform(request: .get(url: .getDemographicMangaList(page: page, per: per)))
  }
  
  func getAuthorMangaList(page: Int?, per: Int? = 10) async throws -> Items {
    try await perform(request: .get(url: .getAuthorMangaList(page: page, per: per)))
  }
  
  func getMangaList(page: Int?, per: Int? = 10) async throws -> Items{
    try await perform(request: .get(url: .getMangaList(page: page, per: per)))
  }
  private func fetchCategories<JSON: Codable>(request: URLRequest, statusCode: Int = 200, response: JSON.Type)async throws -> [JSON]{
    print("URL: \(request.url?.absoluteString ?? "")")
    print("Request:")
    print(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponseFormat
    }

    print("Response:")
    print(String(data: data, encoding: .utf8) ?? "")

    if httpResponse.statusCode != statusCode {
        throw NetworkError.status(httpResponse.statusCode)
    }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode([JSON].self, from: data)
  }
  private func perform(request: URLRequest, statusCode: Int = 200) async throws -> Items {
      print("URL: \(request.url?.absoluteString ?? "")")
      print("Request:")
      print(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")

      let (data, response) = try await URLSession.shared.data(for: request)

      guard let httpResponse = response as? HTTPURLResponse else {
          throw NetworkError.invalidResponseFormat
      }

      print("Response:")
      print(String(data: data, encoding: .utf8) ?? "")

      if httpResponse.statusCode != statusCode {
          throw NetworkError.status(httpResponse.statusCode)
      }

      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      return try decoder.decode(Items.self, from: data)
  }
  enum NetworkError: Error {
      case invalidResponseFormat
      case status(Int)
  }
}
