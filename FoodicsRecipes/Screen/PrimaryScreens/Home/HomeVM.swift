//
//  HomeVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

@Observable
class HomeVM {
    private let isPreview: Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    private let popupMgr = PopupMgr.shared
    private let navMgr = NavigationMgr.shared
    private let httpClient = HTTPClient()
    private let limit = 10
    var recipes: [Recipe] = []
    
    func fetchRecipes() async throws {
        if isPreview {
            recipes = MockData.shared.recipies
        } else {
            popupMgr.showLoading()
            do {
                var components = URLComponents(string: RecipesAPI.baseURL)!
                components.queryItems = RecipesAPI.createQueryItems([
                    .limit: "\(limit)",
                    .skip: "\(recipes.count)"
                ])
                
                guard let url = URL(string: RecipesAPI.baseURL) else { return }
                let resource = Resource(url: url, method: .get(components.queryItems ?? []), modelType: RecipeResponse.self)
                let response = try await httpClient.load(resource)
                if let newRecipies = response.recipes {
                    recipes += newRecipies
                }
                popupMgr.dismissLoading()
            } catch let error{
                popupMgr.showAlert(title: "Oops!", msg: "something went wrong while loading recipes\n\(error.localizedDescription)")
            }
        }
    }
    
    func navigateToDetails(of recipe: Recipe) {
        navMgr.push(.recipeDetail(recipe: recipe))
    }
    
}
