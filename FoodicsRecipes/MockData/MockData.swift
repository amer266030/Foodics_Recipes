//
//  MockData.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

class MockData {
    static let shared = MockData()
    
    private init() {
        fetchData()
    }
    
    var recipies: [Recipe] = []
    
    func fetchData() {
        recipies = [
            Recipe(
                id: 1,
                name: "R1",
                ingredients: [
                    "ing 1",
                    "ing 2"
                ],
                instructions: [
                    "put 1 in 2",
                    "mix 2 in a blender"
                ],
                prepTimeMinutes: 12,
                cookTimeMinutes: 20,
                servings: 4,
                difficulty: .easy,
                cuisine: "Italian",
                caloriesPerServing: 200,
                tags: [
                    "Pizza",
                    "Italian"
                ],
                userId: 99,
                image: "urlString",
                rating: 4.4,
                reviewCount: 2,
                mealType: ["Dinner"]
            ),
            Recipe(
                id: 2,
                name: "R2",
                ingredients: [
                    "ing 1",
                    "ing 2",
                    "ing 3"
                ],
                instructions: [
                    "put 1 in 2",
                    "mix 2 and 3"
                ],
                prepTimeMinutes: 5,
                cookTimeMinutes: 10,
                servings: 1,
                difficulty: .medium,
                cuisine: "American",
                caloriesPerServing: 250,
                tags: [
                    "Burger",
                    "Sandwitch"
                ],
                userId: 88,
                image: "urlString",
                rating: 4.0,
                reviewCount: 23,
                mealType: ["Lunch"]
            )
        ]
    }
    
}
