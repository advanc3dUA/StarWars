//
//  CharacterDetailsView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 01.03.25.
//

import SwiftUI

struct CharacterDetailsView: View {
    @State var character: Character

    var body: some View {
        ZStack {
            BackgroundView()

            List {
                Section {
                    CharacterListRowView(rowLabel: "Name", rowContent: character.name)
                    CharacterListRowView(rowLabel: "Date of birth", rowContent: character.birthYear)
                    CharacterListRowView(rowLabel: "Gender", rowContent: character.gender)
                    CharacterListRowView(rowLabel: "Eye color", rowContent: character.eyeColor)
                    CharacterListRowView(rowLabel: "Hair color", rowContent: character.hairColor)
                    CharacterListRowView(rowLabel: "Skin color", rowContent: character.skinColor)
                    CharacterListRowView(rowLabel: "Mass", rowContent: character.mass)
                } header: {
                    Text("About character")
                        .font(.headline)
                        .opaqueColor()
                        .padding(5)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    CharacterDetailsView(character: Character.sampleCharacter)
}
