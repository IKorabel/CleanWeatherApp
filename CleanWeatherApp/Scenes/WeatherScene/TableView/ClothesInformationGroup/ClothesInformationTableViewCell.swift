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
        return clothesStackView
    }()
    
    lazy var outerwearImage: UIImageView = {
        let outerwearImage = UIImageView()
        outerwearImage.contentMode = .scaleAspectFit
        return outerwearImage
    }()
    
    lazy var trousersImage: UIImageView = {
        let trousersImage = UIImageView()
        trousersImage.contentMode = .scaleAspectFit
        return trousersImage
    }()
    
    lazy var bootsImage: UIImageView = {
        let bootsImage = UIImageView()
        bootsImage.contentMode = .scaleAspectFit
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
        print("Outfit: \(currentWeather.getOutfit())")
    }
    
    func addViews() {
        addShape()
        contentView.addSubview(clothesStackView)
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
        clothesStackView.addBorder()
        backgroundColor = .weatherTableViewBackgroundColor
    }
    
    

}


