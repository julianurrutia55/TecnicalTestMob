//
//  ExtensionViewController.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import UIKit

var containerLoading: UIView?

//MARK: - Show loading indicator
extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        containerLoading?.backgroundColor = .none
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading!.center
        activityIndicator.startAnimating()
        containerLoading?.addSubview(activityIndicator)
        self.view.addSubview(containerLoading!)
    }
    
    func hideLoading () {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
}

