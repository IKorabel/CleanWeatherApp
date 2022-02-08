//
//  DailyWeatherTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    lazy var hourlyWeatherStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var hourLabel: UILabel = {
        let weekdayLabel = UILabel()
        weekdayLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        weekdayLabel.textColor = .white
        weekdayLabel.text = "__"
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        return weekdayLabel
    }()
    
    lazy var hourlyWeatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    lazy var hourlyTemperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    func setHourlyForecast(hourly: Hourly) {
        hourLabel.text = "\(hourly.dt)"
        hourlyTemperatureLabel.text = "\(hourly.temp)"
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
