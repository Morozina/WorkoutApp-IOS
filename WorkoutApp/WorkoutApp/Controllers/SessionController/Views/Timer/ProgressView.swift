//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 12/01/2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(percent: CGFloat) {
            
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let defaultCirclelayer = CAShapeLayer()
            defaultCirclelayer.path = circlePath.cgPath
            defaultCirclelayer.strokeColor = Resources.Colors.TabBar.separator.cgColor
            defaultCirclelayer.lineWidth = 20
            defaultCirclelayer.strokeEnd = 1
            defaultCirclelayer.fillColor = UIColor.clear.cgColor
            defaultCirclelayer.lineCap = .round
            
            let circlelayer = CAShapeLayer()
            circlelayer.path = circlePath.cgPath
            circlelayer.strokeColor = Resources.Colors.TabBar.active.cgColor
            circlelayer.lineWidth = 20
            circlelayer.strokeEnd = percent
            circlelayer.fillColor = UIColor.clear.cgColor
            circlelayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            let dopPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dopPoint)
            dotPath.addLine(to: dopPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Resources.Colors.TabBar.active.cgColor
            bigDotLayer.lineWidth = 20
            bigDotLayer.lineCap = .round
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineWidth = 8
            dotLayer.lineCap = .round
            
            layer.addSublayer(defaultCirclelayer)
            layer.addSublayer(circlelayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
        }
    }
}
