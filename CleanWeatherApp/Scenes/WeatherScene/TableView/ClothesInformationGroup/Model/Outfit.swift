//
//  Outfit.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 24.02.2022.
//

import Foundation
import UIKit

struct Outfit {
    var outfitImage: UIImage
    var outfitName: String
}


enum TypeOfClothing {
    case outerwear(typeOfClothing: Outerwear)
    case trousers(typeOfClothing: Trousers)
    case boots(typeOfClothing: Boots)
    
    var outfit: Outfit {
        switch self {
        case .outerwear(let typeOfClothing):
            switch typeOfClothing {
            case .downJacket: return Outfit(outfitImage: UIImage(named: "icons8-tracksuit-100")!, outfitName: "Пуховик")
            case .jacket: return Outfit(outfitImage: UIImage(named: "icons8-vest-100")!, outfitName: "Жилет")
            case .hoody: return Outfit(outfitImage: UIImage(named: "icons8-mens-hoodie-100")!, outfitName: "Кофта")
            case .shirt: return Outfit(outfitImage: UIImage(named: "icons8-t-shirt-100")!, outfitName: "Футболка")
            }
        case .trousers(let typeOfClothing):
            switch typeOfClothing {
            case .jeans: return Outfit(outfitImage: UIImage(named: "icons8-jeans-100")!, outfitName: "Джинсы")
            case .shorts: return Outfit(outfitImage: UIImage(named: "icons8-long-shorts-100")!, outfitName: "Шорты")
            case .winterPants: return Outfit(outfitImage: UIImage(named: "icons8-jeans-100")!, outfitName: "Зимние штаны")
            }
        case .boots(let typeOfClothing):
            switch typeOfClothing {
            case .sneakers: return Outfit(outfitImage: UIImage(named: "icons8-sneakers-100")!, outfitName: "Кроссовки")
            case .shales: return Outfit(outfitImage: UIImage(named: "icons8-flip-flops-100")!, outfitName: "Сланцы")
            case .winterBoots: return Outfit(outfitImage: UIImage(named: "icons8-winter-boots-100")!, outfitName: "Зимние ботинки")
            }
        }
    }
}

enum Outerwear {
    case downJacket, jacket, hoody, shirt
}

enum Trousers {
    case jeans, shorts, winterPants
}

enum Boots {
    case sneakers, shales, winterBoots
}



