//
//  SplashScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct SplashScreen: View {
    @Bindable var vm = SplashVM()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.background.gradient)
            
            VStack(spacing: 16) {
                
            }
        }
    }
}

#Preview {
    SplashScreen()
}
