//
//   MangaDetail.swift
//  Mangas
//
//  Created by Carlos Mata on 8/18/24.
//

import SwiftUI
import SwiftData

struct MangaDetail: View {
  var manga: Manga
  @State var expandSynopsys = false
  @State var expandBackground = false
//  @Binding var swiftDataVM: SwiftDataVM
  
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
                  .font(.footnote)
                  .lineLimit(4)
                Button{
                  expandSynopsys = true
                }label: {
                  Text("more")
                    .font(.footnote)
                    .underline()
                    .bold()
                }
              }
            }else{
              Text(manga.sypnosis ?? "Not Found")
                .font(.footnote)
              Button{
                expandSynopsys = false
              }label: {
                Text("less")
                  .font(.footnote)
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
                .font(.footnote)
              Spacer()
              Text(manga.chapters.map { String($0) } ?? "Unknown")
                .font(.footnote)
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
                .font(.footnote)
              Spacer()
              Text(manga.cleanedEndDate)
                .font(.footnote)
            }
            Text("Status")
              .font(.headline)
            Text(manga.status?.capitalized ?? "Unknown")
              .font(.footnote)
              
            Text("Background")
              .font(.headline)
            if expandBackground == false{
              VStack(alignment: .leading){
                Text(manga.background ?? "Not found")
                  .font(.footnote)
                  .lineLimit(4)
                Button{
                  expandBackground = true
                }label: {
                  Text("more")
                    .font(.footnote)
                    .underline()
                    .bold()
                }
              }
            }else{
              Text(manga.background ?? "Not found")
                .font(.footnote)
              Button{
                expandBackground = false
              }label: {
                Text("less")
                  .font(.footnote)
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
                .font(.footnote)
              Spacer()
              Text(manga.titleJapanese ?? "Unknown")
                .font(.footnote)
            }
            
            
            
            
            Text("About this Manga")
              .font(.headline)
            detailsAbout(name: "Demographics", manga: manga)
            detailsAbout(name: "Authors", manga: manga)
            detailsAbout(name: "Genres", manga: manga)
            detailsAbout(name: "Themes", manga: manga)
            
            Text("More Information")
              .font(.headline)
            Link(destination: URL(string: manga.cleanedURL)!) {
              Text("Click here")
                .font(.footnote)
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
          Task{
//            try swiftDataVM.saveInSwiftData(name: "MyMangas", mangas: [manga])
          }
        }label:{
          Image(systemName: "plus")
        }
      }
    }
  }
}

#Preview {
//  do {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try ModelContainer(for: MangaCategory.self, configurations: config)
//    return MangaDetail(modelContext: container.mainContext)
//  } catch {
//    fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
//  }
  MangaDetail(manga: Items.itemTest)
}
