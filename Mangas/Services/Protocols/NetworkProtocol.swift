//
//  NetworkProtocol.swift
//  Mangas
//
//  Created by Carlos Mata on 8/14/24.
//

import Foundation

protocol NetworkProtocol{
  func getBestMangaList(page: Int?, per: Int?) async throws -> Items
  func getGenreMangaList(page: Int?, per: Int?) async throws -> Items
  func getThemeMangaList(page: Int?, per: Int?) async throws -> Items
  func getDemographicMangaList(page: Int?, per: Int?) async throws -> Items
  func getAuthorMangaList(page: Int?, per: Int?) async throws -> Items
  func getMangaList(page: Int?, per: Int?) async throws -> Items
  func getGenres() async throws -> [String]
  func getDemographics() async throws -> [String]
  func getThemes() async throws -> [String]
  func getAuthors() async throws -> [Author]
  func getMangasByCategory(category: String, subcategory: String, page: Int?, per: Int?) async throws -> Items
}
