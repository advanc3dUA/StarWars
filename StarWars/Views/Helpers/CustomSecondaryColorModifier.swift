//
//  CustomSecondaryColorModifier.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 01.03.25.
//

import SwiftUI

struct CustomSecondaryColorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white.opacity(0.7))
    }
}
