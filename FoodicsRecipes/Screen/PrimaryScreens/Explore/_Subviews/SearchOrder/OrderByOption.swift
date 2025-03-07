//
//  OrderByOption.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation

enum OrderByOption: String, Identifiable, CaseIterable {
    case ascending
    case descending
    
    var id: String { rawValue }
    
    var strValue: String {
        switch self {
        case .ascending:
            return "asc"
        case .descending:
            return "desc"
        }
    }
    
    var icon: String {
        switch self {
        case .ascending:
            return "arrow.up"
        case .descending:
            return "arrow.down"
        }
    }
    
}
