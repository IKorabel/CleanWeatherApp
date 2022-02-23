//
//  ASLabelWithIconTitle.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import Foundation
import UIKit

enum DetailWeatherInformationManager: Int {
    case uvIndex = 0
    case sunrise = 2
    case wind = 1
    case sunset = 3
    case feelsLike = 5
    case humidity = 4
    
    var labelContent: ASLabelContent {
        switch self {
        case .uvIndex:
            return ASLabelContent(title: "UV INDEX", image: UIImage(named: "avindex")!)
        case .sunrise:
            return ASLabelContent(title: "SUNRISE", image: UIImage(named: "sunrise")!)
        case .wind:
            return ASLabelContent(title: "WIND", image: UIImage(named: "wind1 1")!)
        case .sunset:
            return ASLabelContent(title: "SUNSET", image: UIImage(named: "sunset 1")!)
        case .feelsLike:
            return ASLabelContent(title: "FEELS LIKE", image: UIImage(named: "feelsLiike")!)
        case .humidity:
            return ASLabelContent(title: "HUMIDITY", image: UIImage(named: "humidity")!)
        }
    }
    
    func getDescription(current: Current) -> String {
        switch self {
        case .uvIndex: return current.uvi.getUvIndexDescription()
        case .sunrise: return current.sunrise.convertUnixTimeToDateAndTime().convertTimeToString()
        case .wind:  return "\(Measurement(value: current.wind_speed, unit: UnitSpeed.metersPerSecond))"
        case .sunset: return current.sunset.convertUnixTimeToDateAndTime().convertTimeToString()
        case .feelsLike: return "\(Measurement(value: current.feels_like.rounded(), unit: UnitTemperature.celsius))"
        case .humidity: return String(format: "%.2f%%", current.humidity)
        }
    }
    
    
}
