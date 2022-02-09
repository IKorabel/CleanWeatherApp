//
//  UIViewExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import Foundation
import UIKit

extension UIView {
    
    
    func addASBlurEffect() {
        let blur = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blur)
        blurEffectView.frame = self.bounds
        self.insertSubview(blurEffectView, at: 0)
    }
    
}
