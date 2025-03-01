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
                    CustomListRowView(rowLabel: "Name", rowContent: character.name)
                    CustomListRowView(rowLabel: "Date of birth", rowContent: character.birthYear)
                    CustomListRowView(rowLabel: "Gender", rowContent: character.gender)
                    CustomListRowView(rowLabel: "Eye color", rowContent: character.eyeColor)
                    CustomListRowView(rowLabel: "Hair color", rowContent: character.hairColor)
                    CustomListRowView(rowLabel: "Skin color", rowContent: character.skinColor)
                    CustomListRowView(rowLabel: "Mass", rowContent: character.mass)
                } header: {
                    Text("About character")
                        .font(.headline)
                        .modifier(CustomSecondaryColorModifier())
                        .padding(5)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    let character = Character(birthYear: "1966", eyeColor: "Brown", films: [""], gender: "", hairColor: "", height: "", homeworld: "", mass: "", name: "Pupkin Vasiliy", skinColor: "", created: Date(), edited: Date(), species: [""], starships: [""], url: "", vehicles: [""])
    CharacterDetailsView(character: character)
}
