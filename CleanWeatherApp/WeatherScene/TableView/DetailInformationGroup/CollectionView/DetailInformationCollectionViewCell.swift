//
//  DetailInformationCollectionViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import UIKit

class DetailInformationCollectionViewCell: UICollectionViewCell {
    var current: Current? = nil
    
    lazy var cellHeader: ASLabelWithIcon = {
        let stackview = ASLabelWithIcon()
        contentView.addSubview(stackview)
        return stackview
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        label.textColor = .white
        label.text = "__"
        contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetailInformation(index: Int) {
        guard let detailInformation = DetailWeatherInformationManager(rawValue: index) else { return }
        guard let currentInformation = current else { return }
        cellHeader.setTitleWithIcon(information: detailInformation)
        descriptionLabel.text = detailInformation.getDescription(current: currentInformation)
    }
    
    func setCellSettings() {
        layer.cornerRadius = 15
    }
    
}
