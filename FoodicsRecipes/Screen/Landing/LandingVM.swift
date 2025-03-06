//
//  SplashVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation
import Observation

@Observable
class LandingVM {
    private let navMgr = NavigationMgr.shared
    var currentTab = LandingTabItem.first
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    func navigateToHome() {
        navMgr.push(.home)
    }
}
