//
//  HTTPClientProtocol.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 08/03/2025.
//

import Foundation

protocol HTTPClientProtocol {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T
}
