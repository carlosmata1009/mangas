//
//  Genre.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation
import SwiftData


class Genre: Codable{
  let genre: String
  let id: String
  
  enum CodingKeys: String, CodingKey {
    case genre
    case id
  }
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.genre = try container.decode(String.self, forKey: .genre)
    self.id = try container.decode(String.self, forKey: .id)
  }
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(genre, forKey: .genre)
  }
  init(genre: String, id: String) {
    self.genre = genre
    self.id = id
  }
}
