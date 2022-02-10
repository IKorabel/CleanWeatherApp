//
//  HourlyWeatherTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 09.02.2022.
//

import UIKit

class HourlyWeatherTableViewCell: UITableViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 355, height: 147), collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                     collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        return collectionView
    }()
    
    var hourlyWeather = [Hourly]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
        setCellSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyWeatherCollectionViewCell.self,
                                forCellWithReuseIdentifier: CellIdentifiers.hourlyWeatherCollectionViewCell)
    }
    
    func setHourlyForecast(hourlyForecast: [Hourly]) {
        hourlyWeather = hourlyForecast
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setCellSettings() {
        collectionView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HourlyWeatherTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 147)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let hourlyCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.hourlyWeatherCollectionViewCell, for: indexPath) as? HourlyWeatherCollectionViewCell else { return UICollectionViewCell() }
        hourlyCell.setHourlyForecast(hourly: hourlyWeather[indexPath.row])
        return hourlyCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
