//
//  NetworkMgr.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

class NetworkMgr {
    
    static let shared = NetworkMgr()
    
    private init() {}
    
    static let recipesAPI = RecipesAPI()
}
