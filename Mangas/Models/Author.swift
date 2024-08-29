//
//  Author.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import Foundation
import SwiftData

class Author: Codable{
  let role: String
  let lastName: String
  let firstName: String
  let id: String
  
  enum CodingKeys: String, CodingKey{
    case role
    case lastName
    case firstName
    case id
  }
  
  init(role: String, lastName: String, firstName: String, id: String) {
    self.role = role
    self.lastName = lastName
    self.firstName = firstName
    self.id = id
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.role = try container.decode(String.self, forKey: .role)
    self.lastName = try container.decode(String.self, forKey: .lastName)
    self.firstName = try container.decode(String.self, forKey: .firstName)
    self.id = try container.decode(String.self, forKey: .id)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(role, forKey: .role)
    try container.encode(lastName, forKey: .lastName)
    try container.encode(firstName, forKey: .firstName)
  }
}
