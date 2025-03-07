//
//  Keyboard_Ext.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

extension View {
    func dismissKeyboardOnTap() -> some View {
        self.simultaneousGesture(
            TapGesture()
                .onEnded {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
    }
}
