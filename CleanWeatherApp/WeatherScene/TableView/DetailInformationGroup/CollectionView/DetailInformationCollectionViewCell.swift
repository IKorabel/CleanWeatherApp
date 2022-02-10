//
//  DetailInformationCollectionViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import UIKit

class DetailInformationCollectionViewCell: UICollectionViewCell {

    
    lazy var cellHeader: ASLabelWithIcon = {
        let stackview = ASLabelWithIcon()
        contentView.addSubview(stackview)
        return stackview
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "_ _"
        contentView.addSubview(label)
        NSLayoutConstraint.activate([label.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                                     label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                     label.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetailInformation(currentInfo: Current?,index: Int) {
        guard let detailInformation = DetailWeatherInformationManager(rawValue: index) else { return }
        guard let currentInformation = currentInfo else { return }
        cellHeader.setTitleWithIcon(information: detailInformation)
        descriptionLabel.text = detailInformation.getDescription(current: currentInformation)
    }
    
    func setCellSettings() {
        layer.cornerRadius = 15
        backgroundView = createASBlurEffect()
    }
    
    func setElements() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(cellHeader)
        setCellSettings()
    }
    
}
