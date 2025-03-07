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
                Divider()
                
                SearchOptionsView(selectedSearchOption: $vm.selectedSearchOption)
                    .onChange(of: vm.selectedSearchOption) {
                        vm.searchText = ""
                    }
                
                switch vm.selectedSearchOption {
                case .name:
                    SearchTextFieldView(searchText: $vm.searchText, hint: "Margherita")
                case .tag:
                    SearchTagView(selectedTag: $vm.selectedTag, tags: vm.tags)
                case .mealType:
                    SearchTextFieldView(searchText: $vm.searchText, hint: "Snack")
                }
                
                LargeTitleView(title: "Recipes")
                
                ScrollView(.vertical) {
                    if vm.recipes.isEmpty {
                        ContentUnavailableView("No Search Results", systemImage: "exclamationmark.triangle.fill", description: Text(""))
                    } else {
                        ForEach(vm.recipes) { recipe in
                            RecipeListItem(recipe: recipe)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .refreshable {
                    
                }
            }
            .padding()
        }
        .task {
            if vm.tags.isEmpty { try? await vm.fetchTags() }
        }
    }
}

#Preview {
    ExploreScreen()
}
