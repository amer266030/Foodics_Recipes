//
//  SplashVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation
import Observation

@Observable
class SplashVM {
    var isSplashFinished: Bool = false
    
    @MainActor
    func finishSplash() {
        isSplashFinished = true
    }
}
