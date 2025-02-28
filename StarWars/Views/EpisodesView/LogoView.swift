//
//  LogoView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("Star_Wars_Logo")
            .resizable()
            .scaledToFit()
            .frame(height: 150)
    }
}

#Preview {
    LogoView()
}
