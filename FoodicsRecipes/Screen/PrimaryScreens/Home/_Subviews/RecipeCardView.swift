//
//  RecipeCardView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeCardView: View {
    @State var isLiked: Bool = false
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RecipeImageView(imgurl: recipe.image ?? "")
            
            HStack(spacing: 16) {
                Text(recipe.name ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fontWidth(.condensed)
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.leading)
                Spacer()
                LikeButton(isLiked: $isLiked)
            }
            
            // MARK: - Info Items
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    InfoItemView(iconName: "clock", title: "\(recipe.prepTimeMinutes ?? 0)")
                    InfoItemView(iconName: "bolt.trianglebadge.exclamationmark", title: "\(recipe.difficulty ?? .unknown)")
                        .foregroundStyle(recipe.difficulty?.color ?? .gray)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    InfoItemView(iconName: "fork.knife.circle", title: "\(recipe.cuisine ?? "?")")
                    InfoItemView(iconName: "person", title: "\(recipe.servings ?? 0)")
                }
            }
        }
        .font(.caption)
        .fontWidth(.condensed)
        .foregroundStyle(.text)
        .padding()
        .shadowModifier()
    }
}

#Preview {
    RecipeCardView(recipe: MockData.shared.recipies.first!)
        .padding()
}
