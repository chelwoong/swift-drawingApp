//
//  Shape.swift
//  swift-drawingapp
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation
import CoreGraphics

protocol DrawingAction {
    
    func drawRect(in: CGRect) -> Rectangle
}

class DrawingBoard: DrawingAction {
    
    var drawings = [String: Drawable]()
    
    func drawRect(in bounds: CGRect) -> Rectangle {
        let size = CGSize(width: 100, height: 100)
        let randomOrigin = CGPoint(
            x: .random(in: 0..<bounds.width - size.width),
            y: .random(in: 0..<bounds.height - size.height)
        )
        let rect = Rectangle(frame: .init(origin: randomOrigin, size: size), color: .random)
        self.drawings[rect.id] = rect
        
        return rect
    }
    
    func draw(_ drawing: Drawing, to point: CGPoint) -> Drawing {
        drawing.addLine(to: point)
        self.drawings[drawing.id] = drawing
        
        return drawing
    }
}
