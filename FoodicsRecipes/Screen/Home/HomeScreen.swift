//
//  HomeScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Explore")
                    .font(.headline)
                    .foregroundStyle(.text)
            }
            .padding()
        }
    }
}

#Preview {
    HomeScreen()
}
