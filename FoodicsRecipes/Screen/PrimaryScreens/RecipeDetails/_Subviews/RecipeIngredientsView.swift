//
//  RecipeIngredientsView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeIngredientsView: View {
    let ingredients: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array((ingredients).enumerated()), id: \.offset) { index, ingredient in
                HStack {
                    Text("\(index + 1).")
                        .bold()
                    Text(ingredient)
                }
            }
        }
    }
}

#Preview {
    RecipeIngredientsView(ingredients: [])
}
