//
//  Weather.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 26.01.2022.
//

import Foundation
import CoreLocation

typealias UVindex = Double

struct WeatherInformation: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let current: Current
    var hourly: [Hourly]
    var daily: [Daily]
    
    mutating func sortHourlyArray() {
        hourly.sort { (hour1: Hourly, hour2: Hourly) -> Bool in
            return hour1.dt < hour2.dt
        }
    }
    
    mutating func sortDailyArray() {
        daily.sort { (day1, day2) -> Bool in
            return day1.dt < day2.dt
        }
    }
    
    func defineTheCity() -> String {
        let geoServices = GeoServices()
        var cityName = String()
        geoServices.defineAddress(lat: lat, lon: lon) { place in
            guard let place = place else { return }
            cityName = place.locality ?? ""
        }
        return cityName
    }
}

struct Current: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: UVindex
    let clouds: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    
    
    func getOutfit() -> Outfit {
        let feelsLike = Int(feels_like)
        return Outfit(outerwearImage: getOuterwearOutfit(feelsLike: feelsLike).image,
                      trousersImage: getTrousersOutfit(feelsLike: feelsLike).image,
                      bootsImage: getBootsOutfit(feelsLike: feelsLike).image)
    }
    
    func getOuterwearOutfit(feelsLike: Int) -> OutfitEnum {
        switch feelsLike {
        case Int.min...(6): return .outerwear(typeOfClothing: .downJacket)
        case 7...15: return .outerwear(typeOfClothing: .jacket)
        case 16...25: return .outerwear(typeOfClothing: .hoody)
        case 26...Int.max: return .outerwear(typeOfClothing: .shirt)
        default: return .outerwear(typeOfClothing: .jacket)
        }
    }
    
    func getTrousersOutfit(feelsLike: Int) -> OutfitEnum {
        switch feelsLike {
        case Int.min...(-2): return .trousers(typeOfClothing: .winterPants)
        case 1...23: return .trousers(typeOfClothing: .jeans)
        case 24...Int.max: return .trousers(typeOfClothing: .shorts)
        default: return .trousers(typeOfClothing: .jeans)
        }
    }
    
    func getBootsOutfit(feelsLike: Int) -> OutfitEnum {
        switch feelsLike {
        case Int.min...(-10): return .boots(typeOfClothing: .winterBoots)
        case -9...25: return .boots(typeOfClothing: .sneakers)
        case 26...Int.max: return .boots(typeOfClothing: .shales)
        default: return .boots(typeOfClothing: .winterBoots)
        }
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let clouds: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
}

struct Daily: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Temperature
    let feels_like: Feels_Like
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    let clouds: Int
    let uvi: UVindex
}

struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct Feels_Like: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}
