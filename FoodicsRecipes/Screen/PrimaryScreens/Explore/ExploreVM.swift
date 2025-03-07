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
    private let isPreview: Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    private let popupMgr = PopupMgr.shared
    private let httpClient = HTTPClient()
    var searchText = ""
    var recipies: [Recipe] = []
    var difficulties: [Difficulty] = []
    var tags: [String] = []
    
    func searchRecipies() {
        
    }
    
}
