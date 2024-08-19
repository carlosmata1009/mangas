//
//  Manga.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation

struct Manga: Codable, Identifiable {
  let id: Int
  let status: String
  let genres: [Genre]
  let background: String?
  let endDate: String?
  let url: String
  let chapters: Int?
  let mainPicture: String
  let authors: [Author]
  let sypnosis: String
  let volumes: Int?
  let title: String
  let titleEnglish: String?
  let startDate: String
  let demographics: [Demographic]
  let titleJapanese: String
  let themes: [Theme]
  let score: Double

  var cleanedURLMainPicture: String{
    cleanURL(mainPicture)
  }
  var cleanedURL: String{
    cleanURL(url)
  }
}
struct Items: Codable{
  let items: [Manga]
  let metadata: Metadata?
}
struct Metadata: Codable{
  let total: Int
  let page: Int
  let per: Int
}

func cleanURL(_ str: String) -> String {
  var cleaned = str.trimmingCharacters(in: .init(charactersIn: "\""))
  cleaned = cleaned.replacingOccurrences(of: "\\", with: "")
  return cleaned
}
