//
//  InfoItemView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct InfoItemView: View {
    var iconName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(.purp)
            Text(title)
                .fontWidth(.compressed)
                .lineLimit(1)
        }
    }
}

#Preview {
    InfoItemView(iconName: "circle", title: "circle")
}
