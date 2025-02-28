//
//  EpisodeView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct EpisodeView: View {
    let film: Film
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(style: .init(lineWidth: 2))
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .padding(5)
            
            VStack(alignment: .center) {
                film.displayImage
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text(film.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text(film.releaseDate)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(.white.opacity(0.8))
            .padding()
        }
    }
}

#Preview {
    let film = Film(characters: [""], created: Date(), director: "Yuriy Gudimov", edited: Date(), episodeId: 1, openingCrawl: "Long long time ago in a galaxy far, far away...", planets: [""], producer: "Unknown", releaseDate: "1987-05-25", species: [""], starships: [""], title: "The episode title", url: "", vehicles: [""])
    EpisodeView(film: film)
}
