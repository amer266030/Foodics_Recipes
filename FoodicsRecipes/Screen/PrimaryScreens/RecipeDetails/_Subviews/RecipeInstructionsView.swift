//
//  RecipeInstructionsView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeInstructionsView: View {
    let instructions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array((instructions).enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top) {
                    Text("\(index + 1).")
                        .bold()
                    Text(step)
                }
            }
        }
    }
}

#Preview {
    RecipeInstructionsView(instructions: ["123", "000"])
}
