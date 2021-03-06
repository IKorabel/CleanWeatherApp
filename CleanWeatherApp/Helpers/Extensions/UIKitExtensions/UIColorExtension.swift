//
//  UIColorExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation
import UIKit
extension UIColor {
    
static func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
    
    static var weatherTableViewBackgroundColor: UIColor {
        return UIColor.hexStringToUIColor(hex: "2D3340")  
    }
    
    static var cellTitleColor: UIColor {
        return .hexStringToUIColor(hex: "636972")
    }
    
    static var weatherTableViewSeparatorColor: UIColor {
        return .hexStringToUIColor(hex: "90949B")
    }
    static var rainColor: UIColor {
        return .hexStringToUIColor(hex: "8B91FF")
    }
}

