//
//  Recipe.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

// MARK: - Recipe Model
struct Recipe: Codable, Identifiable, Hashable {
    let iterationID: String? = UUID().uuidString // To avoid duplicate IDs
    let id: Int?
    let name: String?
    let ingredients: [String]?
    let instructions: [String]?
    let prepTimeMinutes: Int?
    let cookTimeMinutes: Int?
    let servings: Int?
    let difficulty: Difficulty?
    let cuisine: String?
    let caloriesPerServing: Int?
    let tags: [String]?
    let userId: Int?
    let image: String?
    let rating: Double?
    let reviewCount: Int?
    let mealType: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case ingredients
        case instructions
        case prepTimeMinutes
        case cookTimeMinutes
        case servings
        case difficulty
        case cuisine
        case caloriesPerServing
        case tags
        case userId
        case image
        case rating
        case reviewCount
        case mealType
    }
}
