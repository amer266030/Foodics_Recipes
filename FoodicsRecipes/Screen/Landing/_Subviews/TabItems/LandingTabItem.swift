//
//  LandingTabItem.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

enum LandingTabItem: Int, Identifiable, CaseIterable, Equatable, Hashable {
    case first = 1, second, third
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .first:
            return "Simple Steps to\nAmazing Flavors!"
        case .second:
            return "Taste the\nJoy of Cooking!"
        case .third:
            return "Cooking Made\nEffortless."
        }
    }
}
