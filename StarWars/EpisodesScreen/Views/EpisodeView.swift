//
//  EpisodeView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(style: .init(lineWidth: 2))
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .padding(5)
            
            VStack(alignment: .center) {
                episode.displayImage
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text(episode.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text(episode.releaseDate)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(.white.opacity(0.8))
            .padding()
        }
    }
}

#Preview {
    let characters = [Character(birthYear: "1966", eyeColor: "Brown", films: [""], gender: "", hairColor: "", height: "", homeworld: "", mass: "", name: "Yuriy Gudimov", skinColor: "", created: Date(), edited: Date(), species: [""], starships: [""], url: "", vehicles: [""])]
    let episode = Episode(title: "The episode title", releaseDate: "1987-05-25", director: "Yuriy Gudimov", episodeId: 1, openingCrawl: "Long long time ago in a galaxy far, far away...", url: "", characters: characters)
    EpisodeView(episode: episode)
}
