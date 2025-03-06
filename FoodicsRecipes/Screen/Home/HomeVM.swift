//
//  HomeVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

@Observable
class HomeVM {
    private let httpClient = HTTPClient()
    var recipies: [Recipe] = []
    var title: String = ""
    var body: String = ""
    
    func fetchRecipes() async throws {
        print("Fetching Started!")
        do {
            guard let url = URL(string: RecipesAPI.baseURL) else { return }
            let resource = Resource(url: url, modelType: [Recipe].self)
            recipies = try await httpClient.load(resource)
            print("Fetching Completed!")
        } catch let error{
            print("Error: \(error.localizedDescription)")
        }
        
    }
}
