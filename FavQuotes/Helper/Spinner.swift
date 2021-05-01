//
//  Spinner.swift
//  FavQuotes
//
//  Created by Anthony Odu on 29/04/2021.
//

import Foundation
import UIKit
class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor =  UIColor(white: 0, alpha: 0.5)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = UIColor(red: 0.23, green: 0.71, blue: 0.29, alpha: 1.00)
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
