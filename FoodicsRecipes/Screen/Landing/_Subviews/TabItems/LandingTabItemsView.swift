//
//  TabItemsView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct LandingTabItemsView: View {
    @Bindable var vm: LandingVM
    
    var body: some View {
        TabView(selection: $vm.currentTab) {
            ForEach(LandingTabItem.allCases) { item in
                Text(item.title)
                    .foregroundStyle(.text)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .tag(item)
            }
        }
        .tabViewStyle(.page)
        .aspectRatio(3, contentMode: .fit)
        .padding()
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 24))
    }
}
