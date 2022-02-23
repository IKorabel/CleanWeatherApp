//
//  UIViewExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import Foundation
import UIKit

extension UIView {
    
    
    func createASBlurEffect() -> UIVisualEffectView {
        let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurEffect.clipsToBounds = true
        blurEffect.layer.cornerRadius = 15
        blurEffect.layer.borderColor = UIColor.white.cgColor
        blurEffect.layer.borderWidth = 0.5
        return blurEffect
    }
    
    func addBorder() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    func makeRoundedtTopCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func makeRoundedBottomCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
}
