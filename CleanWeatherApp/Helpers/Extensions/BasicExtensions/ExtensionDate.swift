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
    
    func hourFromDate() -> Int {
        guard let hour = Calendar.current.dateComponents([.hour], from: self).hour else { return 0 }
        return hour
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
    
    func convertTimeToString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let stringDate = dateFormatter.string(from: self)
        return stringDate
    }
    
    func defineDayPhase() -> MainWeatherBackgroundTheme {
        
        let precipitation: Precipitation = isWinter() ? .snow : .none
        
        let currentTime = hourFromDate()
        
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
