//
//  LogoutCellView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct LogoutCellView: View {
    let action: () -> Void
    
    var body: some View {
        AnimatedButton {
            action()
        } label: {
            HStack {
                Text("Logout")
                Spacer()
                Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                    .foregroundStyle(.accent)
                    .padding()
                    .background(.regularMaterial, in: .circle)
                
            }
            .foregroundStyle(.text)
            .font(.headline)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.text, lineWidth: 1)
            }
        }
    }
}

#Preview {
    LogoutCellView() {
        
    }
}
