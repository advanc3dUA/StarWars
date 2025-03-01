//
//  CustomListRowView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 01.03.25.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel: String
    @State var rowContent: String
    
    var body: some View {
        HStack {
            Text(rowLabel)
                .foregroundStyle(.accent)
            
            Spacer()
            
            Text(rowContent)
                .foregroundStyle(.white.opacity(0.7))
        }
        .font(.headline)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    CustomListRowView(rowLabel: "Name", rowContent: "Luke Skywalker")
}
