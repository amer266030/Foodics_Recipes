//
//  Recipe.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

// MARK: - Root Model
struct RecipeResponse: Codable {
    let recipes: [Recipe]?
    let total: Int?
    let skip: Int?
    let limit: Int?
}

// MARK: - Recipe Model
struct Recipe: Codable, Identifiable, Hashable {
    let id: Int
    let name: String?
    let ingredients: [String]?
    let instructions: [String]?
    let prepTimeMinutes: Int?
    let cookTimeMinutes: Int?
    let servings: Int?
    let difficulty: String?
    let cuisine: String?
    let caloriesPerServing: Int?
    let tags: [String]?
    let userId: Int?
    let image: String?
    let rating: Double?
    let reviewCount: Int?
    let mealType: [String]?
}
