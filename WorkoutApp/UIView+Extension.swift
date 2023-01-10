//
//  UIView+Extension.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

extension UIView {
    func addBottomBorder(color: UIColor, height: CGFloat) {
        let separatopr = UIView()
        separatopr.backgroundColor = color
        separatopr.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        separatopr.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separatopr)
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchUpInside,
            .touchDragOutside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    func addNewView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

@objc extension UIView {
    func handleIn() {
        UIView.animate(withDuration: 0.5) { self.alpha = 0.35 }
    }
    
    func handleOut() {
        UIView.animate(withDuration: 0.5) { self.alpha = 1 }
    }
}
