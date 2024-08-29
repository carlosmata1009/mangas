//
//  FavoriteView.swift
//  Mangas
//
//  Created by Carlos Mata on 8/16/24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
  var mangas: [Manga]
//  @State var swiftDataVM: SwiftDataVM
//  init(modelContext: ModelContext) {
//    let viewModel = SwiftDataVM(context: modelContext)
//    _swiftDataVM = State(initialValue: viewModel)
//  }
  var body: some View {
    NavigationStack{
      ZStack{
        Color("BackgroundColor")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 10){
          ScrollView{
            ForEach(mangas){manga in
              NavigationLink{
                MangaDetail(manga: manga)
              }label:{
                MangaFavoriteRowItem(manga: manga)
              }
            }
          }.padding()
        }
      }
    }
  }
}

#Preview {
//  do {
//  let config = ModelConfiguration(isStoredInMemoryOnly: true)
//  let container = try ModelContainer(for: MangaCategory.self, configurations: config)
//  return FavoriteView(modelContext: container.mainContext)
//} catch {
//  fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
//}
  NavigationStack{
    FavoriteView(mangas: Items.itemsTest.items)
  }
}
