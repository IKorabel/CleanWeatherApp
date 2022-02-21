//
//  ASLabelWithImage.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import UIKit

class ASLabel: UIStackView {

    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .cellTitleColor
        icon.image = UIImage(named: "sunrise")
        NSLayoutConstraint.activate([icon.widthAnchor.constraint(equalToConstant: 19),
                                     icon.heightAnchor.constraint(equalToConstant: 18)])
        return icon
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .cellTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "__"
        label.text = label.text?.uppercased()
        return label
    }()
    
    convenience init(row: Int) {
        self.init()
        commonInit()
    }
    
    func setTitleWithIcon(labelContent: ASLabelContent) {
        icon.image = labelContent.image
        label.text = labelContent.title
        commonInit()
    }
    
    func commonInit() {
        addViews()
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 4
    }
    
    func addViews() {
        addArrangedSubview(icon)
        addArrangedSubview(label)
    }

}

