//
//  RecipeInfoView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeInfoView: View {
    let recipe: Recipe?
    
    var body: some View {
        HStack(spacing: 16) {
            InfoItemView(iconName: "clock", title: "\(recipe?.prepTimeMinutes ?? 0 + (recipe?.cookTimeMinutes ?? 0)) min")
            InfoItemView(iconName: "person.2.fill", title: "\(recipe?.servings ?? 1) servings")
            InfoItemView(iconName: "flame", title: "\(recipe?.caloriesPerServing ?? 0) kcal")
        }
    }
}
