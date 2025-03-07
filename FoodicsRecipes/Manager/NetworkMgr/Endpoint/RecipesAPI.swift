//
//  Recipes.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

struct RecipesAPI {
    static let baseURL = "https://dummyjson.com/recipes"
    
    static func createQueryItems(_ params: [RecipeQueryParam: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key.rawValue, value: $0.value) }
    }
}
