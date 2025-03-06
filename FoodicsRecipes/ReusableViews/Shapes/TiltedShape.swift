//
//  TiltedShape.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct TiltedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        // Define the main shape
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.70389 * height))
        path.addLine(to: CGPoint(x: 0.99914 * width, y: 0.70415 * height))
        path.addLine(to: CGPoint(x: 0, y: height))
        
        // Ensure the path is closed
        path.closeSubpath()
        
        return path
    }
}
