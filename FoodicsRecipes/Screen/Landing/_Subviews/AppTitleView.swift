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
                .bold()
            
            Text("Magic")
                .font(.title)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
        }
        .foregroundStyle(.bg)
    }
}

//#Preview {
//    AppTitleView()
//}
