//
//  Neumorphism.swift
//  CustomTabBar
//
//  Created by François-Xavier on 03/06/2024.
//

import SwiftUI

// Neumorphism View Modifier
struct FlatNeumorphism<S: Shape>: ViewModifier {
    var baseColor: Color
    var shape: S
    
    func body(content: Content) -> some View {
        content
            .background(
                shape
                    .fill(
                        .shadow(.drop(color: .white.opacity(1), radius: 5, x: -5, y: -5))
                        .shadow(.drop(color: .gray.opacity(0.3), radius: 5, x: 10, y: 10))
                    )
                    .foregroundStyle(baseColor)
            )
    }
}

struct InnerNeumorphism<S: Shape>: ViewModifier {
    var baseColor: Color
    var shape: S
    
    func body(content: Content) -> some View {
        content
            .background(
                shape
                    .fill(
                        .shadow(.drop(color: .white.opacity(0.7), radius: 5, x: -5, y: -5))
                        .shadow(.drop(color: .gray.opacity(0.3), radius: 5, x: 10, y: 10))
                        .shadow(.inner(color: .gray.opacity(0.2), radius: 5, x: 10, y: 10))
                        .shadow(.inner(color: .white.opacity(0.7), radius: 5, x: -5, y: -5))
                    )
                    .foregroundStyle(baseColor)
            )
    }
}

struct CurvedNeumorphism<S: Shape>: ViewModifier {
    var baseColor: Color
    var shape: S
    
    func body(content: Content) -> some View {
        content
            .background(
                shape
                    .fill(
                        .shadow(.drop(color: .gray.opacity(0.1), radius: 5, x: -5, y: -5))
                        .shadow(.drop(color: .gray.opacity(0.3), radius: 5, x: 10, y: 10))
                        .shadow(.inner(color: .gray.opacity(0.2), radius: 5, x: -10, y: -10))
                        .shadow(.inner(color: .white.opacity(0.7), radius: 5, x: 5, y: 5))
                    )
                    .foregroundStyle(baseColor)
            )
    }
}

struct BevelNeumorphism<S: Shape>: ViewModifier {
    var baseColor: Color
    var shape: S
    
    func body(content: Content) -> some View {
        content
            .background(
                shape
                    .fill(
                        .shadow(.inner(color: .black.opacity(0.35), radius: 2, x: 5, y: 5))
                        .shadow(.inner(color: .gray.opacity(0.15), radius: 2, x: -2, y: -2))
                    )
                    .foregroundStyle(baseColor)
            )
    }
}

// Extension to use the neumorphism view modifiers easily
extension View {
    func flatNeumorphism<S: Shape>(baseColor: Color, shape: S) -> some View {
        self.modifier(FlatNeumorphism(baseColor: baseColor, shape: shape))
    }
    func innerNeumorphism<S: Shape>(baseColor: Color, shape: S) -> some View {
        self.modifier(InnerNeumorphism(baseColor: baseColor, shape: shape))
    }
    func curvedNeumorphism<S: Shape>(baseColor: Color, shape: S) -> some View {
        self.modifier(CurvedNeumorphism(baseColor: baseColor, shape: shape))
    }
    func bevelNeumorphism<S: Shape>(baseColor: Color, shape: S) -> some View {
        self.modifier(BevelNeumorphism(baseColor: baseColor, shape: shape))
    }
}
