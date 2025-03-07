//
//  PopupMgr.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation
import Observation

@Observable
class PopupMgr {
    static let shared = PopupMgr()
    
    var isLoading = false
    var isAlertVisible = false
    
    var isPopupVisible: Bool {
        isLoading || isAlertVisible
    }
    
    var loadingMsg: String = ""
    
    var alertTitle: String = ""
    var alertMsg: String = ""
    var actionTitle: String?
    var alertAction: (() -> Void)?
    
    private init() {
        
    }
    
    func showLoading(_ msg: String = "Loading...") {
        loadingMsg = msg
        if !isLoading {
            isLoading = true
        }
    }
    
    func dismissLoading() {
        isLoading = false
    }
    
    func showAlert(title: String = "Error", msg: String, alertAction: (actionTitle: String, action: () -> Void)? = nil) {
        isLoading = false
        alertTitle = title
        alertMsg = msg
        isAlertVisible = true
        actionTitle = alertAction?.actionTitle
        self.alertAction = alertAction?.action
    }
    
    func dismissAlert() {
        alertTitle = ""
        alertMsg = ""
        actionTitle = nil
        alertAction = nil
        isAlertVisible = false
    }
}
