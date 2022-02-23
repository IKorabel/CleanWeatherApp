//
//  Outfit.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 24.02.2022.
//

import Foundation
import UIKit

struct Outfit {
    var outerwearImage: OutfitEnum
    var trousersImage: OutfitEnum
    var bootsImage: OutfitEnum
}


enum OutfitEnum {
    case outerwear(typeOfClothing: Outerwear)
    case trousers(typeOfClothing: Trousers)
    case boots(typeOfClothing: Boots)
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


