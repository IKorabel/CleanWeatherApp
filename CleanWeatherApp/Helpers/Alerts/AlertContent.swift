//
//  AlertContent.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 28.02.2022.
//

import Foundation
import UIKit

enum AlertContent {
    case success
    case networkingError
    case geocodingError
    
    var title: String {
        switch self {
        case .success:
            return "Успешно"
        case .networkingError:
            return "Ошибка соединения!"
        case .geocodingError:
            return "Ошибка геолокации"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return ""
        case .networkingError:
            return "Проверьте настройке сети"
        case .geocodingError:
            return "Проверьте включены ли настройки геолокации"
        }
    }
    
}
