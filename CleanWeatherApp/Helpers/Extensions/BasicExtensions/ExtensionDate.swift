//
//  ExtensionDate.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           return dateFormatter.string(from: self)
    }
    
    func isWinter() -> Bool {
        let firstWinterMonths = 1...2
        guard let month = Calendar.current.dateComponents([.month], from: self).month else { return false }
        if firstWinterMonths.contains(month) || month == 12 {
            return true
        } else {
            return false
        }
    }
    
    func defineDayPhase() -> MainWeatherBackgroundTheme {
        
        let precipitation: Precipitation = isWinter() ? .snow : .none
        
        guard let currentTime = Calendar.current.dateComponents([.hour], from: self).hour else {
            return .day(precipitation: precipitation)
        }
        
        let morningTime = 5...11
        let afternoonTime = 12...17
        let eveningTime = 18...22
        
        if morningTime.contains(currentTime) {
            return .morning
        } else if afternoonTime.contains(currentTime) {
            return .day(precipitation: precipitation)
        } else if eveningTime.contains(currentTime) {
            return .evening
        } else {
            return .night(precipitation: precipitation)
        }
    }
    
}
