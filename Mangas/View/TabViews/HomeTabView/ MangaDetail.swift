//
//   MangaDetail.swift
//  Mangas
//
//  Created by Carlos Mata on 8/18/24.
//

import SwiftUI
import SwiftData

struct MangaDetail: View {
  @Environment(\.modelContext) var context
  var manga: Manga
  @State var expandSynopsys = false
  @State var expandBackground = false
  @Query(filter: #Predicate<MangaCategory> { $0.name == "MyMangas" }) private var myMangaCategory: [MangaCategory]
  @State var disabledButton = false
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(alignment: .leading){
        HStack{
          Spacer()
          CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 150, height: 200)
          Spacer()
        }
        .background{
          CustomAsyncImage(url: manga.cleanedURLMainPicture, width: 400, height: 200).opacity(0.35)
        }
        ScrollView{
          VStack(alignment: .leading, spacing: 10) {
            HStack{
              Text(manga.title)
                .font(.title)
                .bold()
             Spacer()
              Text(String(manga.score))
                .font(.headline)
                .padding()
                .background{
                  Circle()
                    .foregroundStyle(.yellow)
                }
            }
            if expandSynopsys == false{
              VStack(alignment: .leading){
                Text(manga.sypnosis ?? "Not Found")
                  .font(.subheadline)
                  .lineLimit(4)
                Button{
                  expandSynopsys = true
                }label: {
                  Text("more")
                    .font(.subheadline)
                    .underline()
                    .bold()
                }
              }
            }else{
              Text(manga.sypnosis ?? "Not Found")
                .font(.subheadline)
              Button{
                expandSynopsys = false
              }label: {
                Text("less")
                  .font(.subheadline)
                  .underline()
                  .bold()
              }
            }
            HStack{
              Text("Volumes")
                .font(.headline)
              Spacer()
              Text("Chapters")
                .font(.headline)
              
            }
            HStack{
              Text(manga.volumes.map { String($0) } ?? "Unknown")
                .font(.subheadline)
              Spacer()
              Text(manga.chapters.map { String($0) } ?? "Unknown")
                .font(.subheadline)
            }
            HStack{
              Text("Start Date")
                .font(.headline)
              Spacer()
              Text("End Date")
                .font(.headline)
              
            }
            HStack{
              Text(manga.cleanedStartDate)
                .font(.subheadline)
              Spacer()
              Text(manga.cleanedEndDate)
                .font(.subheadline)
            }
            Text("Status")
              .font(.headline)
            Text(manga.status?.capitalized ?? "Unknown")
              .font(.subheadline)
              
            Text("Background")
              .font(.headline)
            if expandBackground == false{
              VStack(alignment: .leading){
                Text(manga.background ?? "Not found")
                  .font(.subheadline)
                  .lineLimit(4)
                Button{
                  expandBackground = true
                }label: {
                  Text("more")
                    .font(.subheadline)
                    .underline()
                    .bold()
                }
              }
            }else{
              Text(manga.background ?? "Not found")
                .font(.subheadline)
              Button{
                expandBackground = false
              }label: {
                Text("less")
                  .font(.subheadline)
                  .underline()
                  .bold()
              }
            }
            HStack{
              Text("Title English")
                .font(.headline)
              Spacer()
              Text("Title Japanase")
                .font(.headline)
            }
            HStack{
              Text(manga.titleEnglish ?? "Not found")
                .font(.subheadline)
              Spacer()
              Text(manga.titleJapanese ?? "Unknown")
                .font(.subheadline)
            }
            
            Text("About this Manga")
              .font(.headline)
            AboutMangaDetailsComponent(name: "Demographics", manga: manga)
            AboutMangaDetailsComponent(name: "Authors", manga: manga)
            AboutMangaDetailsComponent(name: "Genres", manga: manga)
            AboutMangaDetailsComponent(name: "Themes", manga: manga)
            
            Text("More Information")
              .font(.headline)
            Link(destination: URL(string: manga.cleanedURL)!) {
              Text("Click here")
                .font(.subheadline)
            }
            Spacer()
          }
          .foregroundStyle(.white)
          .padding()
        .background(Color("BackgroundColor"))
        }
        .padding(.vertical, 3)
        Spacer()
      }
    }
    .toolbar{
      ToolbarItem(placement: .primaryAction) {
        Button{
          addIfNoExist(id: manga.id, manga: manga)
        }label:{
          Image(systemName: "plus")
            .disabled(disabledButton)
        }
      }
    }
  }
  private func addIfNoExist(id: Int, manga: Manga){
    if let myMangaCategory = myMangaCategory.first(where: { $0.name == "MyMangas" }) {
      if myMangaCategory.mangas.contains(where: { $0.id == id }) {
        print("You can't add it twice.")
      }else{
        myMangaCategory.mangas.append(manga)
        do{
          try context.save()
        }catch{
          print("Failed to save after adding manga: \(error.localizedDescription)")
        }
      }
    }else {
      let newCategory = MangaCategory(name: "MyMangas", mangas: [manga])
      context.insert(newCategory)
      do{
        try context.save()
      }catch{
        print("Failed to create new category and save manga: \(error.localizedDescription)")
      }
    }
  }
}

#Preview {
  MangaDetail(manga: Items.itemTest)
}
