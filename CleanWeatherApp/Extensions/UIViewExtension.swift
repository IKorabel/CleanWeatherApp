//
//  UIViewExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: Gradient Extension
    
    func setGradient(startPoint: Point, endPoint: Point) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
        layer.addSublayer(gradientLayer)
    }
    
}



// MARK: EnumExtension

extension UIView {
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing

        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
}
