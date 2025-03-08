//
//  NetworkMgrTest.swift
//  FoodicsRecipesTests
//
//  Created by Amer Alyusuf on 08/03/2025.
//

import Testing
import SwiftUI
@testable import FoodicsRecipes

struct HTTPClientTests {
    
    let httpClient = HTTPClient()
    let baseURL = URL(string: RecipesAPI.baseURL)!
    
    // URL PATH
    @Test(arguments: [
        RecipesAPI.buildURL(path: .tag("1")),
        RecipesAPI.buildURL(path: .search),
        RecipesAPI.buildURL(path: .mealType("1"))
    ])
    func validRequest(url: URL?) async throws {
        #expect(url != nil)
        let resource = Resource(url: url!, modelType: RecipeResponse.self)
        let response = try await httpClient.load(resource)
        
        #expect(response != nil)
    }
    
    // INVALID REQUEST
    @Test(arguments: [
        URL(string: "https://zzaa.com")!
    ])
    func badRequest(url: URL) async {
        let resource = Resource(url: url, modelType: RecipeResponse.self)
        
        do {
            _ = try await httpClient.load(resource)
            #expect(Bool(false), "Expected an error but got success")
        } catch let error as NetworkError {
            #expect(error == .badRequest)
        } catch {
            #expect(Bool(false), "Unexpected error type: \(error)")
        }
    }
    
    // EMPTY RECIPE RESPONSE
    @Test(arguments: [
        RecipesAPI.buildURL(path: .tag("invalid"))!,
    ])
    func emptyResponse(url: URL) async {
        let resource = Resource(url: url, modelType: RecipeResponse.self) // Expecting an array
        
        do {
            let response = try await httpClient.load(resource)
            #expect(response.recipes != nil)
            #expect(response.recipes!.isEmpty, "Expected empty response but got \(response)")
        } catch {
            #expect(Bool(false), "Unexpected error type: \(error)")
        }
    }
    
    // INVALID RESPONSE
    @Test
    func invalidResponse() async {
        let resource = Resource(url: URL(string: "https://google.com")!, modelType: RecipeResponse.self) // Expecting an array
        
        do {
            let response = try await httpClient.load(resource)
            #expect(response != nil)
        } catch let error as NetworkError {
            switch error {
            case .decodingError:
                #expect(true)
            default:
                #expect(Bool(false), "Expected decodingError but got \(error)")
            }
        } catch {
            #expect(Bool(false), "Unexpected error type: \(error)")
        }
    }

    
    // 400 RESPONSE
    @Test(arguments: [
        URL(string: "https://dummyjson.com/http/400")!
    ])
    func apiErrorResponse(url: URL) async {
        let resource = Resource(url: url, modelType: RecipeResponse.self)

        do {
            _ = try await httpClient.load(resource)
            #expect(Bool(false), "Expected errorResponse but got success")
        } catch let error as NetworkError {
            switch error {
                // MARK: - Can be either
            case .errorResponse(let errorResponse):
                // 400 response decoded
                #expect(true, "Received errorResponse: \(errorResponse)")
            case .decodingError:
                // Failed to decode error message from the response
                #expect(true, "Received decodingError")
            default:
                #expect(Bool(false), "Expected decodingError but got \(error)")
            }
        } catch {
            #expect(Bool(false), "Unexpected error type: \(error)")
        }
    }
}

