//
//  RecipeWrapView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeWrapView: View {
    let items: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.purp)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
    }
}
