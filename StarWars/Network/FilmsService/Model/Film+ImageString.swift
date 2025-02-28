//
//  Film+ImageString.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

extension Film {
    var displayImage: Image {
        if (1...6).contains(self.episodeId) {
            return Image("Episode_\(self.episodeId)")
        } else {
            return Image(systemName: "nosign")
        }
    }
}
