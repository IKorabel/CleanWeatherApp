//
//  WeatherInformationHeaderView.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import UIKit

class WeatherInformationHeaderView: UIView {
    
    lazy var weatherInfoStackView: UIStackView = {
        let weatherInfoStackView = UIStackView(frame: frame)
        weatherInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherInfoStackView.axis = .vertical
        weatherInfoStackView.distribution = .fillEqually
        addSubview(weatherInfoStackView)
        NSLayoutConstraint.activate([
            weatherInfoStackView.topAnchor.constraint(equalTo: topAnchor),
            weatherInfoStackView.leftAnchor.constraint(equalTo: leftAnchor),
            weatherInfoStackView.rightAnchor.constraint(equalTo: rightAnchor),
            weatherInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        return weatherInfoStackView
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Неизвестная локация"
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 50)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .white
        temperatureLabel.text = "__°"
        return temperatureLabel
    }()
    
    lazy var weatherDescriptionLabel: UILabel = {
        let weatherDescriptionLabel = UILabel()
        weatherDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionLabel.textAlignment = .center
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.text = "__"
        return weatherDescriptionLabel
    }()
    
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
     }
     
     //initWithCode to init view from xib or storyboard
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setupView()
     }
    
    convenience init(frame: CGRect, weatherInformation: WeatherInformation?) {
        self.init(frame: frame)
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
        weatherDescriptionLabel.text = "\(weatherInfo.current.weather.first!.description)"
    }
     
     //common func to init our view
     private func setupView() {
       backgroundColor = .red
       layer.cornerRadius = 20
       weatherInfoStackView.addArrangedSubview(locationLabel)
       weatherInfoStackView.addArrangedSubview(temperatureLabel)
       weatherInfoStackView.addArrangedSubview(weatherDescriptionLabel)
     }

}
