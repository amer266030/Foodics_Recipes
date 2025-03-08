//
//  MockHTTPClient.swift
//  FoodicsRecipesTests
//
//  Created by Amer Alyusuf on 08/03/2025.
//

//import Foundation
//@testable import FoodicsRecipes
//
//class MockHTTPClient: HTTPClient {
//    var mockResult: Result<RecipeResponse, NetworkError>?
//    
//    override func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
//        if let result = mockResult as? Result<T, NetworkError> {
//            switch result {
//            case .success(let data):
//                return data
//            case .failure(let error):
//                throw error
//            }
//        }
//        throw NetworkError.invalidResponse
//    }
//}
