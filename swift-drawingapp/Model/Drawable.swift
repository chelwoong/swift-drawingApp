//
//  Drawable.swift
//  swift-drawingapp
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation
import CoreGraphics

protocol Drawable: Color {
    var id: String { get }
}

protocol Color {
    var color: DrawColor { get }
}

enum DrawColor: CaseIterable {
    case blue, cyan, brown, mint, pink, orange, yellow, teal, indigo, purple, green
    
    static var random: DrawColor {
        return .allCases.randomElement()!
    }
}

class Rectangle: Drawable {
    
    let id: String
    var frame: CGRect
    var color: DrawColor
    
    var size: CGSize {
        return frame.size
    }
    
    init(
        id: String = UUID().uuidString,
        frame: CGRect,
        color: DrawColor
    ) {
        self.id = id
        self.frame = frame
        self.color = color
    }
}

class Drawing: Drawable {
    
    let id: String
    var context: [CGPoint]
    var color: DrawColor
    
    init(
        id: String = UUID().uuidString,
        context: [CGPoint] = [],
        color: DrawColor = .random
    ) {
        self.id = id
        self.context = context
        self.color = color
    }
    
    func addLine(to point: CGPoint) {
        self.context.append(point)
    }
}
