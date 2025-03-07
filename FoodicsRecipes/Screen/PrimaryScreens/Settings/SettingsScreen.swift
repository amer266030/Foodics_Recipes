//
//  SettingsScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct SettingsScreen: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Bindable var vm = SettingsVM()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                LargeTitleView(title: "Settings")
                
                List {
                    Group {
                        ColorSchemeCellView(isDarkMode: $isDarkMode)
                        LogoutCellView {
                            vm.logout()
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            .padding()
        }
    }
}

#Preview {
    SettingsScreen()
}
