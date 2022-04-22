//
//  UIViewController+Extension.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 22.04.2022.
//

import UIKit

extension UIViewController {
    func presentErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
