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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


