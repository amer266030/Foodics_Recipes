//
//  Difficulty.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case difficult = "Difficult"
    case unknown = "Unknown"
    
    var color: Color {
        switch self {
        case .easy: .green
        case .medium: .orange
        case .hard: .red
        case .difficult: .red
        case .unknown: .gray
        }
    }
}
