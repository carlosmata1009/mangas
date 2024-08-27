//
//  MangasApp.swift
//  Mangas
//
//  Created by Carlos Mata on 8/12/24.
//

import SwiftUI
import SwiftData
@main
struct MangasApp: App {
  init() {
    UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.white
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(for: [MangaCategory.self, Manga.self])
  }
}
