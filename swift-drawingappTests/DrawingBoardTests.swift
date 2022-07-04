//
//  DrawingBoardTests.swift
//  swift-drawingapp
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import XCTest
@testable import swift_drawingapp

class DrawingBoardTests: XCTestCase {
    
    var sut: DrawingBoard!

    override func setUpWithError() throws {
        self.sut = DrawingBoard()
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_drawRect_100x100_사각형을_그리는지() {
        
        // when
        let rect = self.sut.drawRect(in: .init(x: 0, y: 0, width: 1200, height: 800))
        
        // then
        XCTAssertEqual(rect.size, CGSize(width: 100, height: 100))
    }
    
    func test_draw_drawing에_좌표가_추가되는지() {
        // given
        let drawing = Drawing()
        drawing.context.append(CGPoint(x: 100, y: 100))
        
        // when
        let newDrawing = self.sut.draw(drawing, to: CGPoint(x: 105, y: 105))
        
        // then
        XCTAssertEqual(newDrawing.context, [
            CGPoint(x: 100, y: 100),
            CGPoint(x: 105, y: 105)
        ])
    }
}
