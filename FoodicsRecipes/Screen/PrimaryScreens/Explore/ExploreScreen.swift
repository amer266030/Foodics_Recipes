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
                
                DisclosureGroup("Filters") {
                    VStack(alignment: .leading, spacing: 24) {
                        SearchOptionsView(selectedSearchOption: $vm.selectedSearchOption)
                            .onChange(of: vm.selectedSearchOption) {
                                vm.clearPreviousSelection()
                            }
                        
                        SearchOrderView(selectedOrder: $vm.orderByOption)
                        
                        switch vm.selectedSearchOption {
                        case .name:
                            SearchTextFieldView(searchText: $vm.searchText, hint: "Margherita") {
                                Task { await vm.fetchRecipes() }
                            }
                        case .tag:
                            SearchTagView(selectedTag: $vm.selectedTag, tags: vm.tags) {
                                Task { await vm.fetchRecipes() }
                            }
                        case .mealType:
                            SearchTextFieldView(searchText: $vm.searchText, hint: "Snack") {
                                Task { await vm.fetchRecipes() }
                            }
                        }
                    }
                    .padding(.vertical)
                }
                
                LargeTitleView(title: "Recipes")
                
                ScrollView(.vertical) {
                    if vm.recipes.isEmpty {
                        noContentView()
                    } else {
                        VStack {
                            ForEach(vm.recipes) { recipe in
                                Button {
                                    vm.navigateToDetails(of: recipe)
                                } label: {
                                    RecipeListItemView(recipe: recipe)
                                }
                            }
                            
                            HStack {
                                Button("Load More?") {
                                    Task { await vm.fetchRecipes() }
                                }
                                .fontWeight(.semibold)
                                Spacer()
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .refreshable {
                    Task { await vm.fetchRecipes() }
                }
            }
            .padding()
        }
        .onTapGesture { dismissKeyboard() }
        .task {
            if vm.tags.isEmpty { try? await vm.fetchTags() }
        }
    }
}

fileprivate func noContentView() -> some View {
    ContentUnavailableView(
        "No Search Results",
        systemImage: "exclamationmark.triangle.fill",
        description: Text("Try searching for popular recipes like 'Pizza', 'Pasta', or 'Chicken'.")
    )
}

#Preview {
    ExploreScreen()
}
