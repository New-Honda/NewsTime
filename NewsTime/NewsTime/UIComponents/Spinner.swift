//
//  Spinner.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 22.04.2022.
//

import UIKit

class Spinner {
    private var vSpinner: UIView = {
        let spinnerView = UIView()
        spinnerView.backgroundColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 0.4)
        return spinnerView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.color = .white
        return activityIndicator
    }()

    init() {
        vSpinner.addSubview(activityIndicator)
    }

    func showSpinner(onView: UIView) {
        vSpinner.frame = onView.bounds
        activityIndicator.startAnimating()
        activityIndicator.center = vSpinner.center

        DispatchQueue.main.async {
            onView.addSubview(self.vSpinner)
        }
    }

    func removeSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.vSpinner.removeFromSuperview()
        }
    }
}
