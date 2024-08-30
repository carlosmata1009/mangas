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
  let container: ModelContainer
  init() {
    UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.white
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    
    do {
      container = try ModelContainer(for: MangaCategory.self)
    } catch {
      fatalError("Failed to create ModelContainer for Manga.")
    }
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(container)
  }
}
