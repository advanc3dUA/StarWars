//
//  EpisodeDetailsView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @StateObject var viewModel: EpisodeDetailsViewModel
    @State private var screenSize: CGSize?
    @State private var selectedCharacter: Character?
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    headerView
                    
                    Divider()
                        .background(Color.accent)
                    
                    charactersView
                    
                    Divider()
                        .background(Color.accent)
                    
                    descriptionView
                    
                    Spacer()
                }
            }
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.screenSize = geometry.size
                        }
                }
            )
            .sheet(item: $selectedCharacter) { character in
                CharacterDetailsView(character: character)
                    .presentationDetents([.medium])
            }
        }
    }
    
    var headerView: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                Text(viewModel.episode.title)
                    .font(.title)
                
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.center)
                
                Text(viewModel.releaseYear)
                    .font(.headline)
                    .foregroundStyle(.accent.opacity(0.7))
                
                Spacer()
                
                Text("Directed by:\n\(viewModel.episode.director)")
                    .font(.headline)
                    .opaqueColor()
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .foregroundStyle(.accent)
            
            Spacer()
            
            viewModel.episode.displayImage
                .resizable()
                .scaledToFit()
                .frame(width: (screenSize?.width ?? 500) * 0.35)
        }
        .padding(.horizontal, 10)
    }
    
    var charactersView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(viewModel.episode.characters) { character in
                    Button {
                        selectedCharacter = character
                    } label: {
                        CharacterView(name: character.name)
                    }

                }
            }
            .padding(.all, 10)
        }
    }
    
    var descriptionView: some View {
        Text(viewModel.episode.openingCrawl)
            .font(.headline)
            .opaqueColor()
            .padding(10)
    }
}

#Preview {
    EpisodeDetailsView(viewModel: EpisodeDetailsViewModel(episode: Episode.sample))
}
