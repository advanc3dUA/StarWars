//
//  Episode+displayImage.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

extension Episode {
    var displayImage: Image {
        if (1...6).contains(self.episodeId) {
            return Image("Episode_\(self.episodeId)")
        } else {
            return Image(systemName: "nosign")
        }
    }
}
