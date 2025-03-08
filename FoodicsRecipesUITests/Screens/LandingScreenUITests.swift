//
//  Landing.swift
//  FoodicsRecipesUITests
//
//  Created by Amer Alyusuf on 08/03/2025.
//

import Foundation
import XCTest

final class LandingScreenUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    /// ✅ **Test if LandingScreen Loads Properly**
    func testLandingScreenUIElements() throws {
        // Verify ChefHatImgView is visible
        XCTAssertTrue(app.images["chefHatImage"].exists, "Chef hat image should be visible")

        // Verify AppTitleView is visible
        XCTAssertTrue(app.staticTexts["appTitle"].exists, "App title should be visible")

        // Verify Explore Button is visible
        XCTAssertTrue(app.buttons["exploreButton"].exists, "Explore button should be visible")
    }

    /// ✅ **Test if Explore Button Navigates to HomeScreen**
    func testExploreButtonNavigatesToHomeScreen() throws {
        let exploreButton = app.buttons["exploreButton"]
        
        // Verify the button exists
        XCTAssertTrue(exploreButton.exists, "Explore button should be visible")
        
        // Tap the button
        exploreButton.tap()
        
        // Wait for navigation (adjust timeout as needed)
        let homeScreenTitle = app.staticTexts["homeScreenTitle"]
        XCTAssertTrue(homeScreenTitle.waitForExistence(timeout: 8), "Home screen should be visible after tapping Explore")
    }
}
