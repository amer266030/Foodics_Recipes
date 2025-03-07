//
//  RecipeQueryItem.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

enum RecipeQueryParam: String {
    case limit
    case skip
    case select
    case query = "q" // For searching (e.g., ?q=Margherita)
    case sortBy
    case order
}

