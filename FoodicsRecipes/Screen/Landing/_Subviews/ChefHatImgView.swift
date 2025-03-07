//
//  ChefHatView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct ChefHatImgView: View {
    var body: some View {
        HStack {
            Image(.chefHat)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.width/2)
        }
        .frame(maxWidth: .infinity)
    }
}

