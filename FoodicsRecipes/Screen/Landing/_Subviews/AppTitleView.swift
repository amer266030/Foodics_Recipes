//
//  AppTitleView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct AppTitleView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Recipes")
                .font(.largeTitle)
            
            Text("Magic")
                .font(.title)
                .fontWidth(.condensed)
        }
        .foregroundStyle(.bg)
    }
}

//#Preview {
//    AppTitleView()
//}
