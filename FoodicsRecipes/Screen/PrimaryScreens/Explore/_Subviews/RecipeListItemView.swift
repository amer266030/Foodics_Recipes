//
//  RecipeListItem.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeListItemView: View {
    @State private var isLiked = false
    let recipe: Recipe
    
    var body: some View {
        HStack {
            RecipeImageView(imgurl: recipe.image ?? "")
                .padding(4)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.name ?? "")
                        .font(.headline)
                        .fontWidth(.compressed)
                    Spacer()
                    LikeButton(isLiked: $isLiked)
                }
                RatingView(rating: recipe.rating ?? 0, reviewCount: recipe.reviewCount ?? 0, withText: false)
                
                Divider()
                
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
            .padding()
        }
        .foregroundStyle(.text)
        .aspectRatio(3, contentMode: .fit)
        .padding(8)
        .shadowModifier()
    }
}

#Preview {
    ZStack {
        Color.bg
        RecipeListItemView(recipe: MockData.shared.recipies[0])
            .padding()
    }
}
