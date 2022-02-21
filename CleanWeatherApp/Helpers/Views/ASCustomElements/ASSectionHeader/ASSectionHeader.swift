//
//  ASSectionHeader.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 21.02.2022.
//

import UIKit

class ASSectionHeader: UIView {
    
    lazy var labelWithIcon: ASLabel = {
        let labelWithIcon = ASLabel()
        labelWithIcon.translatesAutoresizingMaskIntoConstraints = false
        return labelWithIcon
    }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
         commonInit()
     }
     
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       commonInit()
     }
    
    convenience init(frame: CGRect, sectionTitle: ASLabelTitle) {
        self.init(frame: frame)
        labelWithIcon.setTitleWithIcon(labelContent: sectionTitle.labelContent)
    }
        
    private func setView(labelContent: ASLabelContent) {
        labelWithIcon.setTitleWithIcon(labelContent: labelContent)
        commonInit()
    }
    
    func commonInit() {
        setShape()
        addSubview(labelWithIcon)
        NSLayoutConstraint.activate([
            labelWithIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            labelWithIcon.rightAnchor.constraint(equalTo: rightAnchor),
            labelWithIcon.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            labelWithIcon.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setShape() {
        makeRoundedtTopCorners(radius: 20)
        backgroundColor = .weatherTableViewBackgroundColor
    }
    
}
