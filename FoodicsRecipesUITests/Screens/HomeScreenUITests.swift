//
//  HomeScreenUITests.swift
//  FoodicsRecipesUITests
//
//  Created by Amer Alyusuf on 08/03/2025.
//

import Foundation
import XCTest

final class HomeScreenUITests: XCTestCase {
    let app = XCUIApplication()
    let landingScreen = LandingScreenUITests()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func navigateToHomeIfInLanding() throws {
        let exploreButton = app.buttons["exploreButton"]
        XCTAssertTrue(exploreButton.waitForExistence(timeout: 8), "Explore button should be visible")
        exploreButton.tap()
        sleep(3)
    }

    /// ✅ **Test if HomeScreen Loads Properly**
    func testHomeScreenUIElements() throws {
        try navigateToHomeIfInLanding()
        let homeTitle = app.staticTexts["homeScreenTitle"]
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 8), "Home screen title should be visible")
        
        // Ensure "Load More?" button exists
        let loadMoreButton = app.buttons["loadMoreButton"]
        XCTAssertTrue(loadMoreButton.exists, "Load More button should be visible")
    }

    /// ✅ **Test if Recipes Are Displayed**
    func testRecipesAreDisplayed() throws {
        try navigateToHomeIfInLanding()
        let firstRecipe = app.buttons["recipe_1"]
        
        // Wait for first recipe to appear
        XCTAssertTrue(firstRecipe.waitForExistence(timeout: 5), "First recipe should be visible")
    }

    /// ✅ **Test Recipe Navigation**
    func testNavigateToRecipeDetail() throws {
        try navigateToHomeIfInLanding()
        let firstRecipe = app.buttons["recipe_1"]
        
        // Tap the first recipe
        XCTAssertTrue(firstRecipe.exists, "First recipe should exist")
        firstRecipe.tap()
        
        // Verify navigation to RecipeDetailScreen
        let recipeDetailTitle = app.staticTexts["recipeDetailTitle"]
        XCTAssertTrue(recipeDetailTitle.waitForExistence(timeout: 3), "Recipe detail screen should be visible")
    }
}
