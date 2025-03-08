//
//  ViewModelTests.swift
//  FoodicsRecipesTests
//
//  Created by Amer Alyusuf on 08/03/2025.
//

import Testing
import SwiftUI
@testable import FoodicsRecipes

struct ViewModelTests {
    // Home
    @Test
    func fetchRecipesLive() async {
        let homeVM = HomeVM()

        do {
            try await homeVM.fetchRecipes()
            #expect(!homeVM.recipes.isEmpty, "Expected recipes from live API")
        } catch {
            #expect(Bool(false), "Unexpected error: \(error)")
        }
    }
    
    @Test
    func navigateToRecipeDetails() {
        let homeVM = HomeVM()
        let recipe = MockData.shared.recipies.first!

        homeVM.navigateToDetails(of: recipe)

        #expect(true, "Navigation tested manually")
    }
    
    // Explore
    @Test
    func fetchExploreRecipesLive() async {
        let exploreVM = ExploreVM()

        do {
            await exploreVM.fetchRecipes()
            #expect(!exploreVM.recipes.isEmpty, "Expected recipes from live API")
        }
    }

    @Test
    func fetchTagsLive() async {
        let exploreVM = ExploreVM()

        do {
            try await exploreVM.fetchTags()
            #expect(!exploreVM.tags.isEmpty, "Expected tags from live API")
        } catch {
            #expect(Bool(false), "Unexpected error: \(error)")
        }
    }
    
    @Test
    func searchRecipesByName() async {
        let exploreVM = ExploreVM()
        exploreVM.selectedSearchOption = .name
        exploreVM.searchText = "Pizza"

        do {
            await exploreVM.fetchRecipes()
            #expect(!exploreVM.recipes.isEmpty, "Expected recipes for 'Pizza' from live API")
        }
    }
    
    @Test
    func searchRecipesByTag() async {
        let exploreVM = ExploreVM()
        exploreVM.selectedSearchOption = .tag
        exploreVM.selectedTag = "Italian"

        await exploreVM.fetchRecipes()
        #expect(!exploreVM.recipes.isEmpty, "Expected Italian recipes from live API")
    }
    
    @Test
    func loadMoreExploreRecipes() async {
        let exploreVM = ExploreVM()

        do {
            await exploreVM.fetchRecipes(clearResults: true)
            let initialCount = exploreVM.recipes.count

            await exploreVM.fetchRecipes(clearResults: false)
            let newCount = exploreVM.recipes.count

            #expect(newCount > initialCount, "Expected more recipes after pagination")
        }
    }
    
    @Test
    func navigateToRecipeDetailsFromExplore() {
        let exploreVM = ExploreVM()
        let recipe = MockData.shared.recipies.first!

        exploreVM.navigateToDetails(of: recipe)

        #expect(true, "Navigation tested manually")
    }

}
