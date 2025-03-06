//
//  LoadingView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct LoadingView: View {
    @Binding var msg: String
    
    var body: some View {
        ProgressView(msg)
            .controlSize(.large)
            .padding(24)
            .background(.bg.gradient, in: .rect(cornerRadius: 16))
    }
}

#Preview {
    LoadingView(msg: .constant("Loading"))
}
