//
//  RecipeDetailsScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct RecipeDetailsScreen: View {
    @Bindable var vm: RecipeDetailsVM
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Text(vm.recipe?.name ?? "?")
            }
        }
    }
}

#Preview {
    RecipeDetailsScreen(vm: RecipeDetailsVM())
}
