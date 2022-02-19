//
//  IntExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation

extension Int {
    
    func convertUnixTimeToDateAndTime() -> Date {
        let timeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        return date
    }
    
}

extension Double {
    
        /// Rounds the double to decimal places value
        func rounded(toPlaces places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
        }
}
