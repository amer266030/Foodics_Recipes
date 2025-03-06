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
            backgroundView()
            
            VStack(spacing: 24) {
                ChefHatImgView()
                AppTitleView()
                
                Spacer()
                
                LandingTabItemsView(vm: vm)
                
                AnimatedButton {
                    vm.navigateToHome()
                } label: {
                    ExploreBtnView()
                }
            }
            .padding()
            .onReceive(vm.timer) { _ in
                vm.currentTab = vm.currentTab.next()
            }
        }
        
    }
}

fileprivate func backgroundView() -> some View {
    Group {
        Image(.landingBg)
            .resizable()
            .opacity(0.8)
        
        TiltedShape()
            .fill(.text.gradient)
            .aspectRatio(1, contentMode: .fit)
    }
    .ignoresSafeArea()
}

#Preview {
    NavigationCoordinator()
}
