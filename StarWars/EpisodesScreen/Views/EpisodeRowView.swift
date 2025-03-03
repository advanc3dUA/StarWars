//
//  EpisodeRowView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct EpisodeRowView: View {
    let episode: Episode

    var body: some View {
        ZStack {
            gradientBorder

            VStack(alignment: .center) {
                episodeLogo

                Spacer()

                episodeTitle

                Spacer()

                episodeReleaseDate
            }
            .foregroundStyle(.white.opacity(0.8))
            .padding()
        }
    }

    var gradientBorder: some View {
        Rectangle()
            .stroke(style: .init(lineWidth: 2))
            .foregroundStyle(
                LinearGradient(colors: [.yellow, .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .padding(5)
    }

    var episodeLogo: some View {
        episode.displayImage
            .resizable()
            .scaledToFit()
    }

    var episodeTitle: some View {
        Text(episode.title)
            .font(.headline)
            .fontWeight(.bold)
            .lineLimit(2, reservesSpace: true)
            .multilineTextAlignment(.center)
    }

    var episodeReleaseDate: some View {
        Text(episode.releaseDate)
            .font(.subheadline)
            .fontWeight(.bold)
    }
}

#Preview {
    EpisodeRowView(episode: Episode.sample)
}
