//
//  SettingsScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
            
            VStack(spacing: 16) {
                LargeTitleView(title: "Settings")
            }
        }
    }
}

#Preview {
    SettingsScreen()
}
