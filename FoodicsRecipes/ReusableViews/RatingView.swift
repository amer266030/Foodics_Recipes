//
//  RatingView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    var reviewCount: Int
    var withText: Bool = true
    
    var body: some View {
        HStack(spacing: 2) {
            if withText {
                Text("\(String(format: "%.1f", rating))")
            }
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(index < Int(rating) ? .yellow : .gray)
                    .font(.caption)
            }
            if withText {
                Text("(\(reviewCount))")
            }
        }
        .font(.subheadline)
        .fontWeight(.semibold)
    }
}

#Preview {
    RatingView(rating: 3, reviewCount: 23)
}
