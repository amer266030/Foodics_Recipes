//
//  RecipePathParam.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

enum RecipePathParam {
    case tags
    case tag(String) // e.g. /recipes/tag/Pakistani
    case mealType(String) // e.g. /recipes/meal-type/snack

    var path: String {
        switch self {
        case .tags:
            return "tags"
        case .tag(let name):
            return "tag/\(name)"
        case .mealType(let type):
            return "meal-type/\(type)"
        }
    }
}
