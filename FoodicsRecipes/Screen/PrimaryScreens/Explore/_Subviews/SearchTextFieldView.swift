//
//  SearchTextFieldView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var searchText: String
    var hint: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.accent)
            TextField(hint, text: $searchText)
                .foregroundColor(.text)
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 8))
        .shadow(color: .text.opacity(0.3), radius: 1)
    }
}

#Preview {
    SearchTextFieldView(searchText: .constant(""), hint: "")
}
