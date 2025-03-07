//
//  ColorSchemeView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct ColorSchemeCellView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        AnimatedButton {
            isDarkMode.toggle()
        } label: {
            HStack {
                Text("Color Scheme")
                Spacer()
                Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                    .foregroundStyle(.purp)
                    .padding()
                    .background(.regularMaterial, in: .circle)
            }
            .foregroundStyle(.text)
            .font(.headline)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.text, lineWidth: 1)
            }
        }
    }
}

#Preview {
    ColorSchemeCellView(isDarkMode: .constant(false))
}
