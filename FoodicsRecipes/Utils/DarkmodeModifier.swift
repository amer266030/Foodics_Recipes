//
//  DarkmodeModifier.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

public struct DarkModeModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.colorScheme) private var systemColorScheme

    public init() {
        if UserDefaults.standard.object(forKey: "isDarkMode") == nil {
            let systemIsDark = UITraitCollection.current.userInterfaceStyle == .dark
            UserDefaults.standard.set(systemIsDark, forKey: "isDarkMode")
        }
    }

    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

extension View {
    func darkModeModifier() -> some View {
        self.modifier(DarkModeModifier())
    }
}

