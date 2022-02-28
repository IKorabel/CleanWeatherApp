//
//  ClothesInformationTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 23.02.2022.
//

import UIKit

class ClothesInformationTableViewCell: UITableViewCell {
    
    lazy var clothesStackView: UIStackView = {
        let clothesStackView = UIStackView()
        clothesStackView.axis = .horizontal
        clothesStackView.distribution = .fillEqually
        clothesStackView.translatesAutoresizingMaskIntoConstraints = false
        clothesStackView.addArrangedSubview(outerwearImage)
        clothesStackView.addArrangedSubview(trousersImage)
        clothesStackView.addArrangedSubview(bootsImage)
        contentView.addSubview(clothesStackView)
        return clothesStackView
    }()
    
    lazy var outerwearImage: UIImageView = {
        let outerwearImage = UIImageView()
        outerwearImage.translatesAutoresizingMaskIntoConstraints = false
        outerwearImage.contentMode = .scaleAspectFit
        contentView.addSubview(outerwearImage)
        outerwearImage.image = UIImage(named: "clothes")
        return outerwearImage
    }()
    
    lazy var trousersImage: UIImageView = {
        let trousersImage = UIImageView()
        trousersImage.contentMode = .scaleAspectFit
        trousersImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trousersImage)
        trousersImage.image = UIImage(named: "clothes")
        return trousersImage
    }()
    
    lazy var bootsImage: UIImageView = {
        let bootsImage = UIImageView()
        bootsImage.image = UIImage(named: "clothes")
        bootsImage.translatesAutoresizingMaskIntoConstraints = false
        bootsImage.contentMode = .scaleAspectFit
        contentView.addSubview(bootsImage)
        return bootsImage
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOutfit(currentWeather: Current?) {
        guard let currentWeather = currentWeather else {
            return
        }
        setOutfitImages(outfit: currentWeather.getOutfit())
    }
    
    func setOutfitImages(outfit: Outfit) {
        outerwearImage.image = outfit.outerwearImage
        trousersImage.image = outfit.trousersImage
        bootsImage.image = outfit.bootsImage
    }
    
    func addViews() {
        addShape()
        NSLayoutConstraint.activate([
            clothesStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            clothesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            clothesStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            clothesStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func addShape() {
        makeRoundedBottomCorners(radius: 20)
        selectionStyle = .none
        backgroundColor = .weatherTableViewBackgroundColor
    }
    
    

}


