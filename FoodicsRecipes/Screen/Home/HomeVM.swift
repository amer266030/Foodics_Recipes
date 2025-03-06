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
    private let httpClient = HTTPClient()
    var recipies: [Recipe] = []
    
    func fetchRecipes() async throws {
        if isPreview {
            recipies = MockData.shared.recipies
        } else {
            popupMgr.showLoading()
            do {
                guard let url = URL(string: RecipesAPI.baseURL) else { return }
                let resource = Resource(url: url, modelType: [Recipe].self)
                recipies = try await httpClient.load(resource)
                popupMgr.dismissLoading()
            } catch let error{
                popupMgr.showAlert(title: "Oops!", msg: "something went wrong while loading recipes\n\(error.localizedDescription)")
            }
        }
    }
}
