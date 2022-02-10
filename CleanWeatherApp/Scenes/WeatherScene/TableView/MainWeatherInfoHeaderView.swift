//
//  WeatherInformationHeaderView.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import UIKit

class MainWeatherInfoHeaderView: UIView {
    
    lazy var mainWeatherInfoStackview: UIStackView = {
        let weatherInfoStackView = UIStackView(frame: frame)
        weatherInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherInfoStackView.axis = .vertical
        weatherInfoStackView.spacing = 1
        addSubview(weatherInfoStackView)
        NSLayoutConstraint.activate([
            weatherInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            weatherInfoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
        return weatherInfoStackView
    }()
    
    lazy var highestAndLowestStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([stackView.widthAnchor.constraint(equalToConstant: 40)])
        return stackView
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 37, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Неизвестная локация"
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: 102, weight: .thin)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .white
        temperatureLabel.text = "__°"
        return temperatureLabel
    }()
    
    lazy var weatherDescriptionLabel: UILabel = {
        let weatherDescriptionLabel = UILabel()
        weatherDescriptionLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionLabel.textAlignment = .center
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.text = "__"
        return weatherDescriptionLabel
    }()
    
    lazy var highestTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.textColor = .white
        label.text = "H:_"
        return label
    }()
    
    lazy var lowestTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.textColor = .white
        label.text = "L:_"
        return label
    }()
    
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
     }
     
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setupView()
     }
    
    convenience init(frame: CGRect, weatherInformation: WeatherInformation?) {
        self.init()
        guard let weatherInfo = weatherInformation else { return }
        setWeatherInformation(weatherInformation: weatherInfo)
    }
    
    func setWeatherInformation(weatherInformation: WeatherInformation?) {
        guard let weatherInfo = weatherInformation else { return }
        GeoServices().defineAddress(lat: weatherInfo.lat, lon: weatherInfo.lon) { [self] placemark in
            guard let placemark = placemark else { return }
            locationLabel.text = "\(placemark.locality ?? "")"
        }
        temperatureLabel.text = "\(Int(weatherInfo.current.temp))°"
        setHighestAndLowestTemp(dailyWeather: weatherInfo.daily)
        weatherDescriptionLabel.text = "\(weatherInfo.current.weather.first!.description)"
    }
    
    func setHighestAndLowestTemp(dailyWeather: [Daily]) {
        guard let daily = dailyWeather.first else { return }
        let dailyTemp = daily.temp
        highestTempLabel.text = "H:\(Int(dailyTemp.max))°"
        lowestTempLabel.text = "L: \(Int(dailyTemp.min))°"
    }
    
     
     //common func to init our view
     private func setupView() {
       mainWeatherInfoStackview.addArrangedSubview(locationLabel)
       mainWeatherInfoStackview.addArrangedSubview(temperatureLabel)
       mainWeatherInfoStackview.addArrangedSubview(weatherDescriptionLabel)
       addHighestAndLowestTemperature()
     }
    
    func addHighestAndLowestTemperature() {
        highestAndLowestStackView.addArrangedSubview(highestTempLabel)
        highestAndLowestStackView.addArrangedSubview(lowestTempLabel)
        mainWeatherInfoStackview.addArrangedSubview(highestAndLowestStackView)
    }

}
