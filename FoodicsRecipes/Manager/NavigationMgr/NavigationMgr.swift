//
//  NavigationMgr.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

class NavigationMgr: ObservableObject {
    @Published var path = NavigationPath()
    
    static let shared = NavigationMgr()
    
    private init() {}
    
    /// Push a new route onto the stack
    func push(_ route: AppRoute) {
        withAnimation(.easeIn(duration: 0.4)) {
            path.append(route)
        }
    }

    /// Pop the last screen from the stack
    func pop() {
        withAnimation(.easeOut(duration: 0.5)) {
            path.removeLast()
        }
    }

    /// Reset to root
    func reset() {
        withAnimation(.easeOut(duration: 0.5)) {
            path = NavigationPath()
        }
    }
    
    /// Replace the navigation stack with a new route
    func replaceWith(_ route: AppRoute) {
        withAnimation(.easeInOut(duration: 0.5)) {
            path = NavigationPath()
            path.append(route)
        }
    }
}
