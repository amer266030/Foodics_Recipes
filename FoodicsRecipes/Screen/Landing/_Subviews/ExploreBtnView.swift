//
//  ExploreBtnView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct ExploreBtnView: View {
    var body: some View {
        HStack {
            Text("")
            Spacer()
            Text("Explore Now")
                .foregroundStyle(.bg)
            Spacer()
            Image(systemName: "chevron.right")
                .padding()
                .foregroundStyle(.text)
                .background(.accent.gradient, in: .circle)
        }
        .font(.headline)
        .padding()
        .background(.text.gradient, in: .capsule)
    }
}

#Preview {
    ExploreBtnView()
}
