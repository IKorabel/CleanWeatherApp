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
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
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
        weatherTableView.backgroundColor = .clear
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
      view.backgroundColor = .blue
      WeatherApiManager.shared.getWeatherInRegion(lat: "56.79369773409799", long: "60.624700760136335") { [self] info in
          weatherInfo = info
          DispatchQueue.main.async {
              self.weatherTableView.reloadData()
          }
      }
    configureTableView()
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
        let weatherInformationHeader = WeatherInformationHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width), weatherInformation: weatherInfo)
        return weatherInformationHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createWeatherInformationHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.size.width
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.cellForRow(at: indexPath) else { return UITableViewCell() }
        cell.backgroundColor = .red
        return cell
    }
    
}

