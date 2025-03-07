//
//  RecipeImageView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI
import CachedAsyncImage

struct RecipeImageView: View {
    let imgurl: String
    
    var body: some View {
        CachedAsyncImage(url: URL(string: imgurl)) { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 24))
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.text.gradient)
                
                ChefHatImgView()
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

//#Preview {
//    RecipeImageView(imgurl: "")
//}
