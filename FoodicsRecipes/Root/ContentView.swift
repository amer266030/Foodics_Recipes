//
//  ContentView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct ContentView: View {
    @Bindable var popupMgr = PopupMgr.shared
    let nwk = NetworkHelper.shared
    
    var body: some View {
        Group {
            switch nwk.networkStatus {
            case .satisfied:
                ZStack {
                    HomeScreen()
                        .allowsHitTesting(popupMgr.isPopupVisible ? false : true)
                        .overlay {
                            Color.black.opacity(popupMgr.isPopupVisible ? 0.5 : 0)
                        }
                        .blur(radius: popupMgr.isPopupVisible ? 4 : 0)
                    if popupMgr.isLoading {
                        LoadingView(msg: $popupMgr.loadingMsg)
                    } else if popupMgr.isAlertVisible {
                        AlertView()
                    }
                }
            default:
                ContentUnavailableView("No Connection", systemImage: "exclamationmark.triangle.fill", description: Text("This app requires an internet connection to function properly."))
            }
        }
        .onAppear {
            nwk.startMonitoring()
        }
    }
}

#Preview {
    ContentView()
}
