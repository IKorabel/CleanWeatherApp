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
    case humidity = 6
    
    var title: String {
        switch self {
        case .uvIndex: return "UV INDEX"
        case .sunrise: return "SUNRISE"
        case .wind: return "WIND"
        case .sunset: return "SUNSET"
        case .feelsLike: return "FEELS LIKE"
        case .humidity: return "HUMIDITY"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .uvIndex: return UIImage(named: "avindex")!
        case .sunrise: return UIImage(named: "sunrise")!
        case .wind: return UIImage(named: "wind1")!
        case .sunset: return UIImage(named: "rainfall")!
        case .feelsLike: return UIImage(named: "feelsLiike")!
        case .humidity: return UIImage(named: "humidity")!
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
