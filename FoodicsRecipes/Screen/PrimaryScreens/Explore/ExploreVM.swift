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
    private let popupMgr = PopupMgr.shared
    private let httpClient = HTTPClient()
    // Selected Search Option
    var selectedSearchOption = RecipeSearchOption.name
    // Params
    var searchText = ""
    var selectedTag = ""
    private let limit = 10
    var tags: RecipeTags = []
    // Results
    var recipes: [Recipe] = []
    
    // MARK: - Api Calls
    func searchRecipies() {
//        let searchURL = RecipesAPI.buildURL(queryParams: [.query: searchText, .limit: "10"])
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
