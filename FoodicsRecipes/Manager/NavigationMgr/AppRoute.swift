//
//  AppRoute.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

enum AppRoute: Hashable {
    case splash
    case home
    case recipeDetail(recipe: Recipe)
    case settings
}
