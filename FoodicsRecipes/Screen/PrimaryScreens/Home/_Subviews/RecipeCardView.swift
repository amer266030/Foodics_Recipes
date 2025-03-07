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
            Image(.r1)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 16))
            
            Text(recipe.name ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.leading)
            
            // MARK: - Info Items
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    infoItemView(iconName: "clock", title: "\(recipe.prepTimeMinutes ?? 0)")
                    infoItemView(iconName: "bolt.trianglebadge.exclamationmark", title: "\(recipe.difficulty ?? .unknown)")
                        .foregroundStyle(recipe.difficulty?.color ?? .gray)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    infoItemView(iconName: "fork.knife.circle", title: "\(recipe.cuisine ?? "?")")
                    infoItemView(iconName: "person", title: "\(recipe.servings ?? 0)")
                }
            }
        }
        .font(.caption)
        .fontWidth(.condensed)
        .foregroundStyle(.text)
        .padding()
        .background(.regularMaterial, in: .rect(cornerRadius: 16))
        .overlay(alignment: .topTrailing) {
            Button {
                isLiked.toggle()
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundStyle(isLiked ? .accent : .text)
                    .font(.title)
            }
            .padding()
        }
    }
}

fileprivate func infoItemView(iconName: String, title: String) -> some View {
    HStack {
        Image(systemName: iconName)
            .foregroundStyle(.purp)
        Text(title)
            .fontWidth(.compressed)
            .lineLimit(1)
    }
}

#Preview {
    RecipeCardView(recipe: MockData.shared.recipies.first!)
        .padding()
}
