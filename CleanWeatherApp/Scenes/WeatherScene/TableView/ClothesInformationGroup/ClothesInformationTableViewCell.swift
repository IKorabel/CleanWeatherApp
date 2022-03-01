//
//  ClothesInformationTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 23.02.2022.
//

import UIKit

class ClothesInformationTableViewCell: UITableViewCell {
    
    lazy var clothesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 355, height: 300), collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.addBorder()
        contentView.addSubview(collectionView)
        return collectionView
    }()
    
    var outfit = [Outfit]()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOutfit(currentWeather: Current?) {
        guard let currentWeather = currentWeather else { return }
        self.outfit = currentWeather.getOutfit()
    }
    
    private func configureCollectionView() {
        clothesCollectionView.delegate = self
        clothesCollectionView.dataSource = self
        clothesCollectionView.backgroundColor = .clear
        clothesCollectionView.register(ClothesCollectionViewCell.self,
                                       forCellWithReuseIdentifier: ClothesCollectionViewCell.reuseIdentifier)
        NSLayoutConstraint.activate([
            clothesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            clothesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            clothesCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            clothesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func addViews() {
        addShape()
        configureCollectionView()
    }
    
    func addShape() {
        makeRoundedBottomCorners(radius: 20)
        selectionStyle = .none
        backgroundColor = .weatherTableViewBackgroundColor
    }
    
    

}

extension ClothesInformationTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let outfitCell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothesCollectionViewCell.reuseIdentifier,
                                                                  for: indexPath) as? ClothesCollectionViewCell else
                                                                  { return UICollectionViewCell() }
        outfitCell.setClothes(outfit: outfit[indexPath.row])
        return outfitCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 147)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 31
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}


