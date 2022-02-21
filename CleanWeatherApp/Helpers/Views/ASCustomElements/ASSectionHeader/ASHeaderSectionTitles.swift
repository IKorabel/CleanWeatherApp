//
//  ASHeaderSectionTitles.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 21.02.2022.
//

import Foundation
import UIKit

enum ASLabelTitle {
    case dailyForecast
    case clothes
    case weather(information: DetailWeatherInformationManager)
    
    var labelContent: ASLabelContent {
        switch self {
        case .dailyForecast, .clothes:
            return ASLabelContent(title: "7-DAY FORECAST", image: UIImage(named: "Calendar")!)
        case .weather(let information):
            return information.labelContent
        }
    }
}
