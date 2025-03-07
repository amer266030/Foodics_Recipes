//
//  SearchTagView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct SearchTagView: View {
    @Binding var selectedTag: String
    var tags: RecipeTags
    
    var body: some View {
        HStack {
            Text("Select Tag Name")
            Spacer()
            Menu(selectedTag.isEmpty ? "No Selection" : selectedTag ) {
                ForEach(tags, id: \.self) { tag in
                    Button(tag) {
                        selectedTag = tag
                    }
                }
            }
            .font(.headline)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    SearchTagView(selectedTag: .constant(""), tags: ["123", "aaa"])
}
