//
//  PrimaryView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct PrimaryScreen: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeScreen()
            }
                    
            Tab("Explore", systemImage: "magnifyingglass") {
                ExploreScreen()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
        }
    }
}

#Preview {
    PrimaryScreen()
}
