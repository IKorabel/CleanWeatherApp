//
//  UIViewControllerExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 28.02.2022.
//

import Foundation
import UIKit

fileprivate var activityIndicatorBackgroundView: UIVisualEffectView?
fileprivate var backgroundView: UIView?

extension UIViewController {
    
    
    /// Show Alert on view
    func showAlert(alertType: AlertContent) {
        let alertController = UIAlertController(title: alertType.title,
                                                message: alertType.message,
                                                preferredStyle: .alert)
        let closeAlertButton = UIAlertAction(title: "Закрыть", style: .destructive, handler: nil)
        alertController.addAction(closeAlertButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// ShowLoadingSpinner on View
    func showSpinner() {
        
        backgroundView = UIView(frame: view.bounds)
        backgroundView?.backgroundColor = .blue
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        backgroundView?.addSubview(activityIndicator)
        view.addSubview(backgroundView!)
    }
    
    /// remove active LoadingSpinner from View
    func dismissSpinner() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
}
