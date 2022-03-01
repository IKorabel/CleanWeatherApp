//
//  ClothesCollectionViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 28.02.2022.
//

import Foundation
import UIKit

class ClothesCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "clothesCollectionViewCell"
    
    lazy var outfitStackView: UIStackView = {
    let stackview = UIStackView()
    stackview.axis = .vertical
    stackview.distribution = .fill
    stackview.translatesAutoresizingMaskIntoConstraints = false
    stackview.addArrangedSubview(clothesLabel)
    stackview.addArrangedSubview(clothesImage)
    contentView.addSubview(stackview)
    NSLayoutConstraint.activate([stackview.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
                                 stackview.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                 stackview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                                 stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)])
    return stackview
    }()
    
    lazy var clothesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "__"
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        return label
    }()
    
    lazy var clothesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        contentView.addSubview(image)
        NSLayoutConstraint.activate([image.widthAnchor.constraint(equalToConstant: 30),         image.heightAnchor.constraint(equalToConstant: 26)])
        return image
    }()
    
    func setClothes(outfit: Outfit) {
        clothesImage.image = outfit.outfitImage
        clothesLabel.text = outfit.outfitName
    }
    
    
}
