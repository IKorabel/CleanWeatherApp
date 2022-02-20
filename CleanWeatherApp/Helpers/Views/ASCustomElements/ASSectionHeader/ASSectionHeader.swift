//
//  ASSectionHeader.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 21.02.2022.
//

import UIKit

class ASSectionHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "ASSectionHeader"
    
    lazy var labelWithIcon: ASLabelWithIcon = {
        let labelWithIcon = ASLabelWithIcon(row: 0)
        labelWithIcon.translatesAutoresizingMaskIntoConstraints = false
        return labelWithIcon
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setShape()
        setView()
    }
    
    func setView() {
        addSubview(labelWithIcon)
        NSLayoutConstraint.activate([
            labelWithIcon.leftAnchor.constraint(equalTo: leftAnchor),
            labelWithIcon.rightAnchor.constraint(equalTo: rightAnchor),
            labelWithIcon.topAnchor.constraint(equalTo: topAnchor),
            labelWithIcon.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setShape() {
        layer.cornerRadius = 20
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
