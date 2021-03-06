 //
//  MainWeatherScenePresenter.swift
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

protocol MainWeatherScenePresentationLogic: AnyObject
{
  func presentSomething(response: MainWeatherScene.Something.Response)
}

class MainWeatherScenePresenter: MainWeatherScenePresentationLogic
{
  var viewController: MainWeatherSceneDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: MainWeatherScene.Something.Response)
  {
    let viewModel = MainWeatherScene.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
