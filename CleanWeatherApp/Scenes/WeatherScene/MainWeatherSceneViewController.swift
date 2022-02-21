//
//  MainWeatherSceneViewController.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainWeatherSceneDisplayLogic
{
  func displaySomething(viewModel: MainWeatherScene.Something.ViewModel)
}

class MainWeatherSceneViewController: UIViewController, MainWeatherSceneDisplayLogic
{
  var interactor: MainWeatherSceneBusinessLogic?
  var router: (NSObjectProtocol & MainWeatherSceneRoutingLogic & MainWeatherSceneDataPassing)?
    
  var weatherInfo: WeatherInformation?
    
  lazy var weatherTableView: UITableView = {
      let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .weatherTableViewSeparatorColor
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
   //   tableView.isHidden = true
        return tableView
}()
    

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
    override func loadView() {
        super.loadView()
        view = LinearGradientView()
    }
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = MainWeatherSceneInteractor()
    let presenter = MainWeatherScenePresenter()
    let router = MainWeatherSceneRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  // MARK: ViewsSetup
    func configureTableView() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        weatherTableView.showsVerticalScrollIndicator = false
        weatherTableView.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.dailyWeatherCell)
        weatherTableView.register(HourlyWeatherTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.hourlyWeatherTableViewCell)
        weatherTableView.register(DetailInformationCell.self, forCellReuseIdentifier: CellIdentifiers.detailInformationTableViewCell)
    }
    
    
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
      configureTableView()
      WeatherApiManager.shared.getWeatherInRegion(lat: "56.79369773409799", long: "60.624700760136335") { [self] info in
          weatherInfo = info
          DispatchQueue.main.async { self.weatherTableView.reloadData() }
      }
  }
    
  override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//    view.setGradient(startPoint: .topLeading, endPoint: .bottomTrailing)
  }

    
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = MainWeatherScene.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: MainWeatherScene.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

extension MainWeatherSceneViewController: UITableViewDataSource, UITableViewDelegate {
    
    func createWeatherInformationHeaderView() -> UIView {
        let weatherInformationHeader = MainWeatherInfoHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width), weatherInformation: weatherInfo)
        return weatherInformationHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
          return weatherInfo?.daily.count ?? 0
        case 2:
          return 1
        default:
           return 0
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = createWeatherInformationHeaderView()
            return view
        case 1:
            let sectionHeader = ASSectionHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50),
                                                sectionTitle: ASLabelTitle.dailyForecast)
            return sectionHeader
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            guard let dailyWeather = weatherInfo?.daily else { return }
            if indexPath.row == dailyWeather.count - 1 {
                // rounded
            }
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return view.frame.size.width
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 147
        case 1:
            return 55
        case 2:
            guard weatherInfo?.current != nil else { return 0 }
            return 509
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView.frame.width)
        switch indexPath.section {
        case 0:
            guard let hourlyWeatherCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.hourlyWeatherTableViewCell) as? HourlyWeatherTableViewCell else { return UITableViewCell() }
            hourlyWeatherCell.setHourlyForecast(hourlyForecast: weatherInfo?.hourly ?? [])
            return hourlyWeatherCell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dailyWeatherCell) as? DailyWeatherTableViewCell else { return UITableViewCell() }
            cell.setDailyForecast(daily: weatherInfo?.daily[indexPath.row])
            cell.setCornerRadiusOnlyOnTopAndBottom(indexPathForRow: indexPath.row)
            return cell
        case 2:
            guard let detailInfoCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.detailInformationTableViewCell) as? DetailInformationCell else { return UITableViewCell() }
            detailInfoCell.setCurrentWeather(current: weatherInfo?.current)
            return detailInfoCell
        default:
            return UITableViewCell()
        }
    }
    
}


