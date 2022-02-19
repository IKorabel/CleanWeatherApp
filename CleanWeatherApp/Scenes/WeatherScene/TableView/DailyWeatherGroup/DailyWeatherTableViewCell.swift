//
//  DailyWeatherCollectionViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 07.02.2022.
//

import Foundation
import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    
    lazy var dailyWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 70
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
                                     stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)])
        return stackView
    }()
    
    lazy var tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        contentView.addSubview(stackView)
        return stackView
    }()
    
    lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.text = "__"
        contentView.addSubview(label)
        NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 85)])
        return label
    }()
    
    lazy var minDailyTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .lightGray
        label.text = "__"
        contentView.addSubview(label)
        return label
    }()
    
    lazy var dailyTempIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        NSLayoutConstraint.activate([icon.widthAnchor.constraint(equalToConstant: 30),
                                     icon.heightAnchor.constraint(equalToConstant: 30)])
        return icon
    }()
    
    lazy var maxDailyTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .white
        label.text = "__"
        contentView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setDailyForecast(daily: Daily?) {
        guard let daily = daily else { return }
        weekdayLabel.text = daily.dt.convertUnixTimeToDateAndTime().dayOfTheWeek().shorted(to: 3, exceptionWord: "Today")
        minDailyTempLabel.text = "\(Int(daily.temp.min))°"
        maxDailyTempLabel.text = "\(Int(daily.temp.max))°"
        guard let suitableIcon = WeatherIconManager(rawValue: daily.weather.first!.icon) else { return }
        dailyTempIcon.image = suitableIcon.image
    }
    
    func setCornerRadiusOnlyOnTopAndBottom(indexPathForRow: Int) {
        switch indexPathForRow {
        case 0:
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case 7:
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        default:
            break
        }
    }
    
    func addViews() {
        addViewsToMainStackView()
        cellSettings()
      //  addLabelsToTempStackView()
    }
    
    private func addViewsToMainStackView() {
        dailyWeatherStackView.addArrangedSubview(weekdayLabel)
        dailyWeatherStackView.addArrangedSubview(dailyTempIcon)
        dailyWeatherStackView.addArrangedSubview(tempStackView)
        tempStackView.addArrangedSubview(minDailyTempLabel)
        tempStackView.addArrangedSubview(maxDailyTempLabel)
    }
    
    private func cellSettings() {
        selectionStyle = .none
        backgroundColor = .weatherTableViewBackgroundColor
    }
    
    
}
