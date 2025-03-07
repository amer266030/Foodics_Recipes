//
//  LikeButton.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isLiked: Bool
    
    var body: some View {
        Button {
            isLiked.toggle()
        } label: {
            Image(systemName: "heart.fill")
                .foregroundStyle(isLiked ? .accent : .text)
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    LikeButton(isLiked: .constant(false))
}
