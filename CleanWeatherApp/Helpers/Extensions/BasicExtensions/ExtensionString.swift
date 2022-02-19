//
//  ExtensionString.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 09.02.2022.
//

import Foundation

extension String {
    
    func shorted(to symbols: Int, exceptionWord: String?) -> String {
        guard exceptionWord != self else { return exceptionWord! }
            guard self.count > symbols else {
                return self
            }
        return self.prefix(symbols).uppercased()
        }
}
