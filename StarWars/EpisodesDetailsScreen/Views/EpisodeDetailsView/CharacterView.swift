//
//  CharacterView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 01.03.25.
//

import SwiftUI

struct CharacterView: View {
    let name: String
    var body: some View {
        ZStack {
            background
            
            characterName
            
        }
        .frame(width: 100, height: 75)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 2)
    }
    
    var background: some View {
        LinearGradient(
            colors: [.brown, .black],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var characterName: some View {
        Text(name)
            .font(.headline)
            .opaqueColor()
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CharacterView(name: "Vasiliy Pupkin")
}
