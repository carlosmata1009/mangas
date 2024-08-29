//
//  Demographic.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation
import SwiftData


class Demographic: Codable{
  let demographic: String
  let id: String
  
  enum CodingKeys: String, CodingKey{
    case demographic
    case id
  }
  
  init(demographic: String, id: String) {
    self.demographic = demographic
    self.id = id
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.demographic = try container.decode(String.self, forKey: .demographic)
    self.id = try container.decode(String.self, forKey: .id)
  }
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(demographic, forKey: .demographic)
  }
}
