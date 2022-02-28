//
//  Outfit.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 24.02.2022.
//

import Foundation
import UIKit

struct Outfit {
    var outerwearImage: UIImage
    var trousersImage: UIImage
    var bootsImage: UIImage
}


enum OutfitEnum {
    case outerwear(typeOfClothing: Outerwear)
    case trousers(typeOfClothing: Trousers)
    case boots(typeOfClothing: Boots)
    
    var image: UIImage {
        switch self {
        case .outerwear(let typeOfClothing):
            switch typeOfClothing {
            case .downJacket: return UIImage(named: "icons8-tracksuit-100")!
            case .jacket: return UIImage(named: "icons8-vest-100")!
            case .hoody: return UIImage(named: "icons8-mens-hoodie-100")!
            case .shirt: return UIImage(named: "icons8-t-shirt-100")!
            }
        case .trousers(let typeOfClothing):
            switch typeOfClothing {
            case .jeans: return UIImage(named: "icons8-jeans-100")!
            case .shorts: return UIImage(named: "icons8-long-shorts-100")!
            case .winterPants: return UIImage(named: "icons8-jeans-100")!
            }
        case .boots(let typeOfClothing):
            switch typeOfClothing {
            case .sneakers: return UIImage(named: "icons8-sneakers-100")!
            case .shales: return UIImage(named: "icons8-flip-flops-100")!
            case .winterBoots: return UIImage(named: "icons8-winter-boots-100")!
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



