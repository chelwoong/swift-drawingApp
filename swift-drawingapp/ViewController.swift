//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var drawView: UIView!
    
    private var drawingBoard: DrawingAction!
    private var drawingFactory: DrawingFactory!
    
    private var canFreeDrawing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDI()
    }
    
    // TOOD: DI
    func setupDI() {
        self.drawingBoard = DrawingBoard()
        self.drawingFactory = DrawingFactory()
    }
    
    @IBAction
    private func rectangleButtonDidTap(_ sender: UIButton) {
        let rect = self.drawingBoard.drawRect(in: self.drawView.bounds)
        let rectView = self.drawingFactory.makeRectView(with: rect)
        rectView.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(self.drawingViewDidTapped(_:))
        ))
        self.drawView.addSubview(rectView)
    }
    
    @IBAction
    private func drawButtonDidTap(_ sender: UIButton) {
        self.canFreeDrawing = true
    }
    
    @IBAction
    private func drawTriggered(_ sender: UIPanGestureRecognizer) {
        guard self.canFreeDrawing else { return }
    }
    
    @objc
    private func drawingViewDidTapped(_ sender: UIView) {
        
    }
}
