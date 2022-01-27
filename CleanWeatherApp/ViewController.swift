//
//  ViewController.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherApiManager.shared.getWeatherInRegion(lat: "59.932602", long: "30.347810") { weatherInformation in
            print(weatherInformation.current.temp)
        }
        
        // Do any additional setup after loading the view.
    }


}

