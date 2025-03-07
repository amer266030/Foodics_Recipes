//
//  TiltedShape.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import SwiftUI

struct HalfCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99907*width, y: 0.00093*height))
        path.addLine(to: CGPoint(x: 0.99907*width, y: 0.49355*height))
        path.addCurve(to: CGPoint(x: 0.50001*width, y: 0.99907*height), control1: CGPoint(x: 0.99907*width, y: 0.77274*height), control2: CGPoint(x: 0.77563*width, y: 0.99907*height))
        path.addCurve(to: CGPoint(x: 0.00093*width, y: 0.49355*height), control1: CGPoint(x: 0.22439*width, y: 0.99907*height), control2: CGPoint(x: 0.00093*width, y: 0.77274*height))
        path.addLine(to: CGPoint(x: 0.00093*width, y: 0.00093*height))
        path.addLine(to: CGPoint(x: 0.99907*width, y: 0.00093*height))
        path.closeSubpath()
        return path
    }
}
