//
//  NavigationCoordinator.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct NavigationCoordinator: View {
    @ObservedObject var navMgr = NavigationMgr.shared

    var body: some View {
        NavigationStack(path: $navMgr.path) {
            SplashScreen()
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                        .navigationBarBackButtonHidden()
                }
        }
    }

    /// Returns the correct view for a given route
    @ViewBuilder
    func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .splash: SplashScreen()
        case .home: HomeScreen()
        case .recipeDetail(let recipe): RecipeDetailsScreen(vm: RecipeDetailsVM(recipe: recipe))
        case .settings: SettingsScreen()
        }
    }
}
