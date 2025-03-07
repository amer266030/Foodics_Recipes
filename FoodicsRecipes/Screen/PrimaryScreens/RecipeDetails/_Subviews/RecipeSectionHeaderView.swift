//
//  RecipeSectionHeaderView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct RecipeSectionHeaderView: View {
    let title: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.accent)
                Text(title)
                    .font(.headline)
                    .bold()
            }
        }
    }
}
