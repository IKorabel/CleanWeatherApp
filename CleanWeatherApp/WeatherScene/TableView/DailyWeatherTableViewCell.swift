//
//  DailyWeatherTableViewCell.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    
    lazy var weekdayLabel: UILabel = {
        let weekdayLabel = UILabel()
        weekdayLabel.text = "__"
        return weekdayLabel
    }()
    
    lazy var weekdayWeatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
