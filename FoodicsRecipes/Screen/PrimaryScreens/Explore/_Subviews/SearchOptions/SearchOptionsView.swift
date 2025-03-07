//
//  RecipeSearchByView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct SearchOptionsView: View {
    @Binding var selectedSearchOption: RecipeSearchOption
    
    var body: some View {
        HStack {
            Text("Search By:")
                .font(.subheadline)
            Spacer()
            Menu(selectedSearchOption.strValue) {
                ForEach(RecipeSearchOption.allCases) { option in
                    Button(option.strValue) {
                        selectedSearchOption = option
                    }
                }
            }
            .font(.headline)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    SearchOptionsView(selectedSearchOption: .constant(.name))
}
