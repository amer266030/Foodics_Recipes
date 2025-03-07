//
//  ExploreScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct ExploreScreen: View {
    @Bindable var vm = ExploreVM()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    LargeTitleView(title: "Explore")
                    Text("Look for your favorite recipes")
                        .font(.headline)
                }
                
                TextField("", text: $vm.searchText)
            }
            .padding()
        }
    }
}

#Preview {
    ExploreScreen()
}
