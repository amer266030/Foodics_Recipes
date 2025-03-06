//
//  SplashScreen.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct LandingScreen: View {
    @Bindable var vm = LandingVM()
    
    var body: some View {
        ZStack(alignment: .top) {
            ContainerRelativeShape()
                .fill(.bg.gradient)
            
            TiltedShape()
                .fill(.pr.gradient)
                .frame(height: UIScreen.height/1.75)
            
            VStack(spacing: 16) {
                ChefHatImgView()
                AppTitleView()
                
                RecipeListImgView()
                    .rotationEffect(.degrees(-25))
                    .rotation3DEffect(.degrees(25), axis: (x: 35, y: 45, z: 0))
                
                Spacer()
                
                VStack(spacing: 48) {
                    LandingTabItemsView(vm: vm)
                        
                    AnimatedButton {
                        vm.navigateToHome()
                    } label: {
                        ExploreBtnView()
                    }
                }
            }
            .padding(.top, 24)
            .padding(32)
            .onReceive(vm.timer) { _ in
                vm.currentTab = vm.currentTab.next()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationCoordinator()
}
