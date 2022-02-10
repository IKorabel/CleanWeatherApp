//
//  ExtensionDate.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation

extension Date {
    
    /// Определить день недели у заданной даты. Используется в ячейке по прогнозу по дням недели
    func dayOfTheWeek() -> String {
        guard !isDeviceDayTheSame(otherDate: self) else { return "Today" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    /// Соответствует ли день на устройстве дню, заданному в дате в аргументе.
    func isDeviceDayTheSame(otherDate: Date) -> Bool {
        guard let deviceDay = Date().getDateComponents().day, let otherDateDay = getDateComponents().day else { return false}
        return deviceDay == otherDateDay
    }
    
    /// Проверяет одинаковое ли время устройства и у задаанной двты, также и календарный день
    func isDeviceHourAndDayTheSame() -> Bool {
        return Date().hourFromDate() == hourFromDate() && isDeviceDayTheSame(otherDate: self)
    }
    
    /// Определяет тот час из даты который нужно отобразить. Используется в ячейке по прогнозу по часам
    func getHourDescription() -> String {
        guard !self.isDeviceHourAndDayTheSame() else { return "Now" }
        return "\(self.hourFromDate())"
    }
    
    func getDateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
    
    func hourFromDate() -> Int {
        guard let hour = getDateComponents().hour else { return 0 }
        return hour
    }
    
    /// Определить зима ли сейчас
    func isWinter() -> Bool {
        let firstWinterMonths = 1...2
        guard let month = getDateComponents().month else { return false }
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
    
    
    /// Определить фазу дня. Используется для настройки цветовой темы градиентов
    func defineDayPhase() -> MainWeatherBackgroundTheme {
        
        let precipitation: Precipitation = isWinter() ? .snow : .none
        
        let currentTime = hourFromDate()
        
        let morningTime = 5...11
        let afternoonTime = 12...17
        let eveningTime = 18...22
        
        switch currentTime {
        case morningTime: return .morning
        case afternoonTime: return .day(precipitation: precipitation)
        case eveningTime:  return .evening
        default: return .night(precipitation: precipitation)
        }
    }
    
}
