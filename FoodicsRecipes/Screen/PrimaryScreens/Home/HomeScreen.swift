//
//  HomeScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    @Bindable var vm = HomeVM()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                LargeTitleView(title: "Recipes")
                    .accessibilityIdentifier("homeScreenTitle")
                
                ScrollView(.vertical) {
                    LazyVStack(spacing: 24) {
                        LazyVGrid(columns: createGridItems(numItems: 2), spacing: 16) {
                            ForEach(vm.recipes, id: \.iterationID) { recipe in
                                Button {
                                    vm.navigateToDetails(of: recipe)
                                } label: {
                                    RecipeCardView(recipe: recipe)
                                }
                                .accessibilityIdentifier("recipe_\(recipe.id ?? 1)")
                            }
                        }
                    }
                    HStack {
                        Button("Load More?") {
                            Task { try? await vm.fetchRecipes() }
                        }
                        .accessibilityIdentifier("loadMoreButton")
                        .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
        }
        .task {
            if vm.recipes.isEmpty {
                try? await vm.fetchRecipes()
            }
        }
    }
}

fileprivate func createGridItems(numItems: Int) -> [GridItem] {
    let columns = [GridItem](repeating: GridItem(.flexible(), spacing: 16), count: numItems)
    return columns
}

#Preview {
    let navMgr = NavigationMgr.shared
    ContentView()
        .onAppear {
            navMgr.push(.primary)
        }
}
