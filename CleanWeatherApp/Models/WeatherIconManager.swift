//
//  WeatherImage.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case thunderstorm = "11d"
    case drizzle = "09d"
    case rain = "10d"
    case snow = "13d"
    case atmosphere = "50d"
    case clearSkyDay = "01d"
    case clearSkyNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    
    var image: UIImage {
        switch self {
        case .thunderstorm:
            return UIImage(named: "cloud.bolt.rain 1")!
        case .drizzle, .rain:
            return UIImage(named: "cloud.drizzle 1")!
        case .snow:
            return UIImage(named: "snowflake")!
        case .atmosphere:
            return UIImage(named: "wind1")!
        case .clearSkyDay:
            return UIImage(named: "icons8-sun-60")!
        case .clearSkyNight:
            return UIImage(named: "moon")!
        case .fewCloudsDay:
            return UIImage(named: "cloud.sun 1")!
        case .fewCloudsNight:
            return UIImage(named: "cloud.moon 1")!
        case .scatteredCloudsDay, .scatteredCloudsNight:
            return UIImage(named: "cloud 1")!
        case .brokenCloudsDay, .brokenCloudsNight:
            return UIImage(named: "smoke")!
        }
    }
}
