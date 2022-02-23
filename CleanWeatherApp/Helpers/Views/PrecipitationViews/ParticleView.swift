//
//  ParticleView.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 21.02.2022.
//

import Foundation
import UIKit

class ParticleView: UIView {
    var particleImage: UIImage?
    var precipitation: Precipitation = .none
    override class var layerClass: AnyClass {
            return CAEmitterLayer.self
    }
    
    convenience init(precipitation: Precipitation) {
        self.init()
        self.precipitation = precipitation
    }
    
    
    func makeEmitterCell(birthRate: Float,color: UIColor, velocity: CGFloat, scale: CGFloat) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = birthRate
        cell.lifetime = 20.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = velocity
        cell.velocityRange = velocity / 4
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 8
        cell.scale = scale
        cell.scaleRange = scale / 3

        cell.contents = particleImage?.cgImage
        return cell
    }
    
    func setPrecipitationToViews() {
        guard let emitter = self.layer as? CAEmitterLayer else { return }
        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
        
        
        
        if precipitation == .snow {
            let near = makeEmitterCell(birthRate: 10, color: UIColor(white: 1, alpha: 1), velocity: 100, scale: 0.3)
            let middle = makeEmitterCell(birthRate: 10, color: UIColor(white: 1, alpha: 0.66), velocity: 80, scale: 0.2)
            let far = makeEmitterCell(birthRate: 10, color: UIColor(white: 1, alpha: 0.33), velocity: 60, scale: 0.1)
            emitter.emitterCells = [near, middle, far]
        } else if precipitation == .rain {
            let near = makeEmitterCell(birthRate: 350, color: .rainColor, velocity: 500, scale: 0.014)
            let middle = makeEmitterCell(birthRate: 350, color: .rainColor.withAlphaComponent(0.66), velocity: 300, scale: 0.09)
            let far = makeEmitterCell(birthRate: 350, color: .rainColor.withAlphaComponent(0.33), velocity: 100, scale: 0.04)
            emitter.emitterCells = [near, middle, far]
        }
    }
    
    override func layoutSubviews() {
        setPrecipitationToViews()
    }
}

