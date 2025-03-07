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
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 24) {
                    RecipeImageView(imgurl: vm.recipe?.image ?? "")
                        .overlay(alignment: .topLeading) {
                            NavBackButton()
                                .padding()
                        }
                    
                    Text(vm.recipe?.name ?? "?")
                        .font(.headline)
                    
                    RatingView(rating: vm.recipe?.rating ?? 0, reviewCount: Int(vm.recipe?.rating ?? 0))
                    RecipeInfoView(recipe: vm.recipe)
                    
                    // Ingredients Section
                    RecipeSectionHeaderView(title: "Ingredients", icon: "list.bullet")
                    RecipeIngredientsView(ingredients: vm.recipe?.ingredients ?? [])
                    
                    // Instructions Section
                    RecipeSectionHeaderView(title: "Instructions", icon: "text.justify")
                    RecipeInstructionsView(instructions: vm.recipe?.instructions ?? [])
                    
                    if let tags = vm.recipe?.tags, !tags.isEmpty {
                        RecipeSectionHeaderView(title: "Tags", icon: "tag")
                        RecipeWrapView(items: tags)
                    }
                    
                    // Meal Type
                    if let mealTypes = vm.recipe?.mealType, !mealTypes.isEmpty {
                        RecipeSectionHeaderView(title: "Meal Type", icon: "fork.knife")
                        RecipeWrapView(items: mealTypes)
                    }
                }
                .padding(24)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    let navMgr = NavigationMgr.shared
    ContentView()
        .onAppear {
            navMgr.push(.primary)
            navMgr.push(.recipeDetail(recipe: MockData.shared.recipies[0]))
        }
}
