//
//  CharacterListRowView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 01.03.25.
//

import SwiftUI

struct CharacterListRowView: View {
    @State var rowLabel: String
    @State var rowContent: String
    
    var body: some View {
        HStack {
            Text(rowLabel)
                .foregroundStyle(.accent)
            
            Spacer()
            
            Text(rowContent)
                .opaqueColor()
        }
        .font(.headline)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    CharacterListRowView(rowLabel: "Name", rowContent: "Luke Skywalker")
}
