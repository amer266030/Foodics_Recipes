//
//  RecipeSearchOption.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

enum RecipeSearchOption: String, Identifiable, CaseIterable {
    case name
    case tag
    case mealType
    
    var id: String { rawValue }
    
    var strValue: String {
        switch self {
        case .name: "Name"
        case .tag: "Tag"
        case .mealType: "Meal Type"
        }
    }
}
