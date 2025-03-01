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
            LinearGradient(colors: [.brown, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Text(name)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
            
        }
        .frame(width: 100, height: 75)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 2)
    }
}

#Preview {
    CharacterView(name: "Vasiliy Pupkin")
}
