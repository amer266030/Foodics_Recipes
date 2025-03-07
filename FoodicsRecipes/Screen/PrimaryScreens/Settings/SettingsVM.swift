//
//  SettingsVM.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI
import Observation

@Observable
class SettingsVM {
    private let navMgr = NavigationMgr.shared
    private let popupMgr = PopupMgr.shared
    
    @MainActor
    func logout() {
        popupMgr.showAlert(
            title: "Logout",
            msg: "Are you sure you want to logout?",
            alertAction: ("Yes", { self.navMgr.reset() })
        )
    }
    
}

