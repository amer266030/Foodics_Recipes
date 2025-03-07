//
//  ExploreVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import Foundation
import Observation

@Observable
class ExploreVM {
    private let navMgr = NavigationMgr.shared
    private let popupMgr = PopupMgr.shared
    private let httpClient = HTTPClient()
    // Selected Search Option
    var selectedSearchOption = RecipeSearchOption.name
    // Params
    var searchText = ""
    var selectedTag = ""
    var orderByOption = OrderByOption.ascending
    private let limit = 10
    var tags: RecipeTags = []
    // Results
    var recipes: [Recipe] = []
    
    // MARK: - Functions
    
    func navigateToDetails(of recipe: Recipe) {
        navMgr.push(.recipeDetail(recipe: recipe))
    }
    
    // when switching search options
    func clearPreviousSelection() {
        searchText = ""
        selectedTag = ""
    }
    
    // load more vs. new search
    func fetchRecipes(clearResults: Bool = true) async {
        let isPaginated = !clearResults
        let skipValue = isPaginated ? "\(recipes.count)" : "0"

        // Build query parameters
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: RecipeQueryParam.limit.rawValue, value: "\(limit)"),
            URLQueryItem(name: RecipeQueryParam.sortBy.rawValue, value: "name"),
            URLQueryItem(name: RecipeQueryParam.order.rawValue, value: orderByOption.strValue),
            URLQueryItem(name: RecipeQueryParam.skip.rawValue, value: skipValue)
        ]

        // Modify query parameters based on selected search option
        let url: URL?
        switch selectedSearchOption {
        case .name:
            queryParams.append(URLQueryItem(name: RecipeQueryParam.query.rawValue, value: searchText))
            url = RecipesAPI.buildURL(path: .search)
        case .tag:
            url = RecipesAPI.buildURL(path: .tag(selectedTag))
        case .mealType:
            url = RecipesAPI.buildURL(path: .mealType(searchText))
        }

        // Call performSearch with query parameters
        try? await performSearch(url: url, params: queryParams, clearResults: clearResults)
    }
    
    // Api Calls
    
    func performSearch(url: URL?, params: [URLQueryItem], clearResults: Bool) async throws {
        popupMgr.showLoading()
        do {
            guard let url else { return }
            let resource = Resource(url: url, method: .get(params), modelType: RecipeResponse.self)
            let response = try await httpClient.load(resource)

            if clearResults {
                recipes = response.recipes ?? [] // Replace old results
            } else {
                recipes += response.recipes ?? [] // Append new results
            }

            popupMgr.dismissLoading()
        } catch let error {
            popupMgr.showAlert(title: "Oops!", msg: "Something went wrong while loading recipes\n\(error.localizedDescription)")
        }
    }
    
    func fetchTags() async throws {
        popupMgr.showLoading()
        do {
            guard let url = RecipesAPI.buildURL(path: .tags) else { return }
            let resource = Resource(url: url, modelType: RecipeTags.self)
            let response = try await httpClient.load(resource)
            tags = response
            popupMgr.dismissLoading()
        } catch let error{
            popupMgr.showAlert(title: "Oops!", msg: "something went wrong while loading recipes\n\(error.localizedDescription)")
        }
    }
    
}
