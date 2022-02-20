//
//  GradientView.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 08.02.2022.
//

import Foundation
import UIKit

class LinearGradientView: UIView {
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing

        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    private var topColor: UIColor = UIColor.blue
    private var bottomColor: UIColor = UIColor.purple
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let themeGradientColor = Date().defineDayPhase().themeGradientColors
        gradientLayer.colors = [themeGradientColor.firstGradientColor.cgColor, themeGradientColor.secondGradientColor.cgColor]
        gradientLayer.startPoint = Point.topLeading.point
        gradientLayer.endPoint = Point.bottomTrailing.point
        layer.addSublayer(gradientLayer)
        createPrecipitationView()
        createGroundView()
    }
    
    func createPrecipitationView() {
        let snow = ParticleView()
        snow.particleImage = UIImage(named: "snow-particle")
        snow.translatesAutoresizingMaskIntoConstraints = false
        addSubview(snow)
        NSLayoutConstraint.activate([
            snow.leadingAnchor.constraint(equalTo: leadingAnchor),
            snow.trailingAnchor.constraint(equalTo: trailingAnchor),
            snow.topAnchor.constraint(equalTo: topAnchor),
            snow.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func createGroundView() {
        let ground = GroundView()
        ground.path = ground.makeGround()
        ground.strokeColor = .white
        ground.fillColor = .white
        ground.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ground)
        NSLayoutConstraint.activate([
            ground.leadingAnchor.constraint(equalTo: leadingAnchor),
            ground.trailingAnchor.constraint(equalTo: trailingAnchor),
            ground.bottomAnchor.constraint(equalTo: bottomAnchor),
            ground.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
}
