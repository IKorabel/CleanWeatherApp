//
//  MainWeatherSceneRouter.swift
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

@objc protocol MainWeatherSceneRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MainWeatherSceneDataPassing
{
  var dataStore: MainWeatherSceneDataStore? { get }
}

class MainWeatherSceneRouter: NSObject, MainWeatherSceneRoutingLogic, MainWeatherSceneDataPassing
{
  weak var viewController: MainWeatherSceneViewController?
  var dataStore: MainWeatherSceneDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
//  func navigateToSomewhere(source: MainWeatherSceneViewController, destination: SomewhereViewController)
//  {
//    source.show(destination, sender: nil)
//  }
//  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: MainWeatherSceneDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
