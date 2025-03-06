//
//  RecipeImgView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct RecipeListImgView: View {
    var body: some View {
        Image(.recipeList)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(24)
    }
}
