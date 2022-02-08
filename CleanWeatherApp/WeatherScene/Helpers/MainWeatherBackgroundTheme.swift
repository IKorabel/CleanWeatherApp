//
//  MainWeatherSceneTheme.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 09.02.2022.
//

import Foundation
import UIKit

enum MainWeatherBackgroundTheme {
    case morning
    case day(precipitation: Precipitation)
    case evening
    case night(precipitation: Precipitation)
    
    var themeGradientColors: GradientColor {
        switch self {
        case .morning:
            return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "73C4E6"),
                                 secondGradientColor: UIColor.hexStringToUIColor(hex: "F5E085"))
        case .day(let precipitation):
            switch precipitation {
            case .snow:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "D6D8DF"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "A1B3C8"))
            case .rain:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "0F1D51"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "8CA3BC"))
            case .none:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "115ACE"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "68C2F7"))
            }
        case .evening:
            return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "121D54"),
                                 secondGradientColor: UIColor.hexStringToUIColor(hex: "D787B9"))
        case .night(let precipitation):
            switch precipitation {
            case .snow:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "202F49"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "758DAE"))
            case .rain:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "062B3E"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "9BBFD2"))
            case .none:
                return GradientColor(firstGradientColor: UIColor.hexStringToUIColor(hex: "040E31"),
                                     secondGradientColor: UIColor.hexStringToUIColor(hex: "363B92"))
            }
        }
    }
}

enum Precipitation {
    case snow,rain, none
}

