//
//  AnimatedButton.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct AnimatedButton<Content: View>: View {
    @State private var isTapped = false
    
    let action: () -> Void
    let label: () -> Content
    
    var body: some View {
        Button(action: {
            isTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isTapped = false
                action()
            }
        }) {
            label()
                .scaleEffect(isTapped ? 0.9 : 1.0)
                .animation(.bouncy(duration: 0.3, extraBounce: 0.1), value: isTapped)
        }
    }
}
