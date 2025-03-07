//
//  RecipeDetailsVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation
import Observation

@Observable
class RecipeDetailsVM {
    var recipe: Recipe?
    
    init(recipe: Recipe? = nil) {
        self.recipe = recipe
    }
}

