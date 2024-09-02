//
//  NetworkProtocol.swift
//  Mangas
//
//  Created by Carlos Mata on 8/14/24.
//

import Foundation

protocol NetworkProtocol{
  func getBestMangaList(page: Int?, per: Int?) async throws -> Items
  func getMangaList(page: Int?, per: Int?) async throws -> Items
  func getGenres() async throws -> [String]
  func getDemographics() async throws -> [String]
  func getThemes() async throws -> [String]
  func getAuthors() async throws -> [Author]
  func getMangasByCategory(category: String, subcategory: String, page: Int?, per: Int?) async throws -> Items
  func getMangasByFilterBegin(word: String) async throws -> [Manga]
  func getMangasByFilterContain(word: String) async throws -> Items
  func getImagesForPortada(page: Int, per: Int)async throws -> Items
}
