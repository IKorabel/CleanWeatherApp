//
//  HourlyWeatherTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 09.02.2022.
//

import UIKit

class HourlyWeatherTableViewCell: UITableViewCell {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                     collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        return collectionView
    }()
    
    var hourlyWeather = [Hourly]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setHourlyForecast(hourlyForecast: [Hourly]) {
        hourlyWeather = hourlyForecast
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HourlyWeatherTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyWeather.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
