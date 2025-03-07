//
//  LargeTitleView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct LargeTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.text)
    }
}

#Preview {
    LargeTitleView(title: "Recipes")
}
