//
//  AlertView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct AlertView: View {
    var popupMgr = PopupMgr.shared
    var actionTitle: String?
    var action: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 16) {
            Text(popupMgr.alertTitle)
                .font(.title)
                .fontWeight(.semibold)
            Text(popupMgr.alertMsg)
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(6)
            
            HStack(spacing: 16) {
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        popupMgr.dismissAlert()
                    }
                } label: {
                    Text("Dismiss")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
                if let action = popupMgr.alertAction, let actionTitle = popupMgr.actionTitle {
                    Button {
                        popupMgr.dismissAlert()
                        action()
                    } label: {
                        Text(actionTitle)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 40)
        .background(Color.bg.gradient, in: .rect(cornerRadius: 24))
        .padding(32)
    }
}

#Preview {
    AlertView() {}
}
