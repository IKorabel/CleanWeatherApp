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
        stackview.distribution = .fillProportionally
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackview)
        NSLayoutConstraint.activate([stackview.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                                     stackview.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                     stackview.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        return stackview
    }()
    
    lazy var hourLabel: UILabel = {
        let weekdayLabel = UILabel()
        weekdayLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        weekdayLabel.textColor = .white
        weekdayLabel.textAlignment = .center
        weekdayLabel.text = "__"
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weekdayLabel)
        return weekdayLabel
    }()
    
    lazy var hourlyWeatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        NSLayoutConstraint.activate([icon.widthAnchor.constraint(equalToConstant: 30),       icon.heightAnchor.constraint(equalToConstant: 26)])
        return icon
    }()
    
    lazy var hourlyTemperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(temperatureLabel)
        return temperatureLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackview()
        setSettingsToCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHourlyForecast(hourly: Hourly) {
        hourLabel.text = "\(hourly.dt.convertUnixTimeToDateAndTime().hourFromDate())"
        hourlyTemperatureLabel.text = "\(Int(hourly.temp))°"
        guard let weather = hourly.weather.first,
              let icon = WeatherIconManager(rawValue: weather.icon) else { return }
        hourlyWeatherIcon.image = icon.image
    }
    
    
    func addStackview() {
        hourlyWeatherStackView.addArrangedSubview(hourLabel)
        hourlyWeatherStackView.addArrangedSubview(hourlyWeatherIcon)
        hourlyWeatherStackView.addArrangedSubview(hourlyTemperatureLabel)
    }
    
    func setSettingsToCell() {
        backgroundColor = .clear
    }
}
