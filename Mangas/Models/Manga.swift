//
//  Manga.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation
import SwiftData

@Model
class Manga: Codable, Identifiable{
  var id: Int
  var status: String
  var genres: [Genre]
  var background: String?
  var endDate: String?
  var url: String
  var chapters: Int?
  var mainPicture: String
  var authors: [Author]
  var sypnosis: String
  var volumes: Int?
  var title: String
  var titleEnglish: String?
  var startDate: String?
  var demographics: [Demographic]
  var titleJapanese: String
  var themes: [Theme]
  var score: Double
  
  
  enum CodingKeys: String, CodingKey {
    case id
    case status
    case genres
    case background
    case endDate
    case url
    case chapters
    case mainPicture
    case authors
    case sypnosis
    case volumes
    case title
    case titleEnglish
    case startDate
    case demographics
    case titleJapanese
    case themes
    case score
    
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    status = try container.decode(String.self, forKey: .status)
    genres = try container.decode([Genre].self, forKey: .genres)
    background = try container.decodeIfPresent(String.self, forKey: .background)
    endDate = try container.decodeIfPresent(String.self, forKey: .endDate)
    url = try container.decode(String.self, forKey: .url)
    chapters = try container.decodeIfPresent(Int.self, forKey: .chapters)
    mainPicture = try container.decode(String.self, forKey: .mainPicture)
    authors = try container.decode([Author].self, forKey: .authors)
    sypnosis = try container.decode(String.self, forKey: .sypnosis)
    volumes = try container.decodeIfPresent(Int.self, forKey: .volumes)
    title = try container.decode(String.self, forKey: .title)
    titleEnglish = try container.decodeIfPresent(String.self, forKey: .titleEnglish)
    startDate = try container.decodeIfPresent(String.self, forKey: .startDate)
    demographics = try container.decode([Demographic].self, forKey: .demographics)
    titleJapanese = try container.decode(String.self, forKey: .titleJapanese)
    themes = try container.decode([Theme].self, forKey: .themes)
    score = try container.decode(Double.self, forKey: .score)
    
  }
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(status, forKey: .status)
    try container.encode(genres, forKey: .genres)
    try container.encodeIfPresent(background, forKey: .background)
    try container.encodeIfPresent(endDate, forKey: .endDate)
    try container.encode(url, forKey: .url)
    try container.encodeIfPresent(chapters, forKey: .chapters)
    try container.encode(mainPicture, forKey: .mainPicture)
    try container.encode(authors, forKey: .authors)
    try container.encode(sypnosis, forKey: .sypnosis)
    try container.encodeIfPresent(volumes, forKey: .volumes)
    try container.encode(title, forKey: .title)
    try container.encodeIfPresent(titleEnglish, forKey: .titleEnglish)
    try container.encodeIfPresent(startDate, forKey: .startDate)
    try container.encode(demographics, forKey: .demographics)
    try container.encode(titleJapanese, forKey: .titleEnglish)
    try container.encode(themes, forKey: .themes)
    try container.encode(score, forKey: .score)
    
  }

  var cleanedURLMainPicture: String{
    cleanURL(mainPicture)
  }
  var cleanedURL: String{
    cleanURL(url)
  }
}
class Items: Codable{
  let items: [Manga]
  let metadata: Metadata?
  init(items: [Manga], metadata: Metadata?) {
    self.items = items
    self.metadata = metadata
  }
}
class Metadata: Codable{
  let total: Int
  let page: Int
  let per: Int
  init(total: Int, page: Int, per: Int){
    self.total = total
    self.page = page
    self.per = per
  }
}

func cleanURL(_ str: String) -> String {
  var cleaned = str.trimmingCharacters(in: .init(charactersIn: "\""))
  cleaned = cleaned.replacingOccurrences(of: "\\", with: "")
  return cleaned
}

@Model
class MangaCategory {
    let name: String
    @Relationship(deleteRule: .cascade) var mangas: [Manga]
    
    init(name: String, mangas: [Manga] = []) {
        self.name = name
        self.mangas = mangas
    }
}
