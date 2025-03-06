//
//  NavBackButton.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct NavBackButton: View {
    var previousViewName: String = ""
    private let navMgr = NavigationMgr.shared
    
    var body: some View {
        Button {
            navMgr.pop()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "arrow.left")
                Text(previousViewName)
            }
        }
        .foregroundStyle(.accent)
        .font(.caption)
    }
}

#Preview {
    NavBackButton()
}
