//
//  DetailInformationCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import Foundation
import UIKit

class DetailInformationCell: UITableViewCell {
    var currentWeather: Current? = nil
    
    lazy var detailInformationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 162, height: 165)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 509),
                                              collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.leftAnchor.constraint(equalTo: leftAnchor),
                                      collectionView.rightAnchor.constraint(equalTo: rightAnchor),
                                      collectionView.topAnchor.constraint(equalTo: topAnchor),
                                      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        setSettings()
        configureCollectionView()
    }
    
    func setSettings() {
        backgroundColor = .clear
    }
    
    func configureCollectionView() {
        detailInformationCollectionView.delegate = self
        detailInformationCollectionView.dataSource = self
        detailInformationCollectionView.backgroundColor = .clear
        detailInformationCollectionView.register(DetailInformationCollectionViewCell.self,
                                                 forCellWithReuseIdentifier: CellIdentifiers.detailInformationCollectionViewCell)
    }
    
    func setCurrentWeather(current: Current?) {
        guard let current = current else { return }
        self.currentWeather = current
    }
}

extension DetailInformationCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let detailInformationCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.detailInformationCollectionViewCell, for: indexPath) as? DetailInformationCollectionViewCell else { return UICollectionViewCell() }
        detailInformationCell.backgroundColor = .blue
        detailInformationCell.setDetailInformation(index: indexPath.row)
        return detailInformationCell
    }
    
    
}
