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
        ZStack(alignment: .topLeading) {
            LandingBGImageView()
            
            VStack(alignment: .leading, spacing: 24) {
                Spacer()
                ChefHatImgView()
                Spacer()
                AppTitleView()
                LandingTabItemsView(vm: vm)
                    .onReceive(vm.timer) { _ in
                        vm.currentTab = vm.currentTab.next()
                    }
                
                AnimatedButton {
                    vm.navigateToHome()
                } label: {
                    ExploreBtnView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationCoordinator()
}
