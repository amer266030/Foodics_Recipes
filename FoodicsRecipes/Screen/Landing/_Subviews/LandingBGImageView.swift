//
//  LandingBGImage.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct LandingBGImageView: View {
    var body: some View {
        Image(.landingBg)
            .resizable()
            .blur(radius: 1)
            .opacity(0.8)
            .overlay {
                Color.bg.opacity(0.4)
            }
        .ignoresSafeArea()
    }
}

#Preview {
    LandingBGImageView()
}
