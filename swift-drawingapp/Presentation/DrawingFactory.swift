//
//  DrawingFactory.swift
//  swift-drawingapp
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import UIKit

struct DrawingFactory {

    func makeRectView(with rect: Rectangle) -> UIView {
        let view = UIView(frame: rect.frame)
        view.backgroundColor = convertSystemColor(with: rect.color)
        return view
    }
}

extension DrawingFactory {
    
    private func convertSystemColor(with color: DrawColor) -> UIColor {
        switch color {
        case .blue:
            return .systemBlue
        case .cyan:
            return .systemCyan
        case .brown:
            return .systemBrown
        case .mint:
            return .systemMint
        case .pink:
            return .systemPink
        case .orange:
            return .systemOrange
        case .yellow:
            return .systemYellow
        case .teal:
            return .systemTeal
        case .indigo:
            return .systemIndigo
        case .purple:
            return .systemPurple
        case .green:
            return .systemGreen
        }
    }
}
