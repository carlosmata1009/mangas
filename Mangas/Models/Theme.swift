//
//  Theme.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation
import SwiftData

class Theme: Codable{
  let theme: String
  let id: String
  
  enum CodingKeys: CodingKey {
    case theme
    case id
  }
  
  init(theme: String, id: String){
    self.theme = theme
    self.id = id
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.theme = try container.decode(String.self, forKey: .theme)
    self.id = try container.decode(String.self, forKey: .id)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.theme, forKey: .theme)
    try container.encode(self.id, forKey: .id)
  }
  
}
