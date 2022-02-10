//
//  UVIndexExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import Foundation

extension UVindex {
    
    /// Определить уровень опасности ультрафиолетового индекса
    func defineLevelOfUV() -> String {
        switch self {
        case 0...2: return "Low"
        case 3...5: return "Moderate"
        case 6...7: return "High"
        case 8...10: return "Very high"
        case 11...100: return "Extremely high"
        default: return ""
        }
    }
    
    func getUvIndexDescription() -> String {
        return "\(Int(self)) \n\(defineLevelOfUV())"
    }
}
