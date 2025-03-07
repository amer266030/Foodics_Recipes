//
//  RecipeResponse.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

struct RecipeResponse: Codable {
    let limit: Int?
    let recipes: [Recipe]?
    let skip, total: Int?
}
