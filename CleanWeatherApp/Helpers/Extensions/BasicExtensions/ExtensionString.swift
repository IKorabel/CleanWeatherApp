//
//  ExtensionString.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 09.02.2022.
//

import Foundation

extension String {
    
        func shorted(to symbols: Int) -> String {
            guard self.count > symbols else {
                return self
            }
            return self.prefix(symbols).uppercased()
        }
}
