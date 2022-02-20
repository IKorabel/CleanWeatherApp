//
//  ShapeView.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 21.02.2022.
//

import Foundation
import UIKit

class GroundView: UIView {
    var strokeWidth: CGFloat = 2.0
    var strokeColor: UIColor = UIColor.black
    var fillColor: UIColor = UIColor.clear
    var path: UIBezierPath?

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func layoutSubviews() {
       let layer = self.layer as! CAShapeLayer

       // take a copy of our original path, because we're about to stretch it
       guard let pathCopy = path?.copy() as? UIBezierPath else { return }

       // create a transform that stretches the path by our width and height, and apply it to the copy
       pathCopy.apply(CGAffineTransform(scaleX: bounds.width, y: bounds.height))

       // apply all our properties to the shape layer
       layer.strokeColor = strokeColor.cgColor
       layer.fillColor = fillColor.cgColor
       layer.lineWidth = strokeWidth
       layer.shadowColor = strokeColor.cgColor
       layer.shadowRadius = 5
       layer.shadowOffset = .zero
       layer.shadowOpacity = 1

       // convert the UIBezierPath to a CGPath and use it for the shape path
       layer.path = pathCopy.cgPath
   }
    
    func makeGround() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0.77))
        bezierPath.addLine(to: CGPoint(x: 0, y: 1.0))
        bezierPath.addLine(to: CGPoint(x: 1.0, y: 1.0))
        bezierPath.addLine(to: CGPoint(x: 1.0, y: 0.08))
        bezierPath.addCurve(to: CGPoint(x: 0.80, y: 0.08), controlPoint1: CGPoint(x: 1.0, y: 0.08), controlPoint2: CGPoint(x: 0.91, y: 0.02))
        bezierPath.addCurve(to: CGPoint(x: 0.55, y: 0.02), controlPoint1: CGPoint(x: 0.69, y: 0.13), controlPoint2: CGPoint(x: 0.56, y: 0.02))
        bezierPath.addCurve(to: CGPoint(x: 0.34, y: 0.02), controlPoint1: CGPoint(x: 0.54, y: 0.02), controlPoint2: CGPoint(x: 0.44, y: -0.03))
        bezierPath.addCurve(to: CGPoint(x: 0.112, y: 0.024), controlPoint1: CGPoint(x: 0.25, y: 0.08), controlPoint2: CGPoint(x: 0.20, y: -0.03))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 0.08), controlPoint1: CGPoint(x: 0.02, y: 0.08), controlPoint2: CGPoint(x: 0, y: 0.08))

        return bezierPath
    }
}

