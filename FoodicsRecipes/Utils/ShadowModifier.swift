//
//  ShadowModifier.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        .bg.gradient
                            .shadow(.inner(color: .bg.opacity(0.5), radius: 4, x: 2, y: 2))
                            .shadow(.inner(color: .text.opacity(0.3), radius: 4, x: -2, y: -2))
                    )
            }
    }
}

// Extension for easy usage
extension View {
    func shadowModifier() -> some View {
        self.modifier(ShadowModifier())
    }
}
