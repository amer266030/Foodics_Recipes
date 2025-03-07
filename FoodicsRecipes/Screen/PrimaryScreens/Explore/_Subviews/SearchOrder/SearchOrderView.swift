//
//  OrderByView.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 07/03/2025.
//

import SwiftUI

struct SearchOrderView: View {
    @Binding var selectedOrder: OrderByOption
    
    var body: some View {
        HStack {
            Text("Sort:")
                .font(.subheadline)
            Spacer()
            
            Menu {
                ForEach(OrderByOption.allCases) { option in
                    Button(option.rawValue) {
                        selectedOrder = option
                    }
                }
            } label: {
                Label(selectedOrder.rawValue, systemImage: selectedOrder.icon)
            }
            .font(.headline)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    SearchOrderView(selectedOrder: .constant(.ascending))
}
