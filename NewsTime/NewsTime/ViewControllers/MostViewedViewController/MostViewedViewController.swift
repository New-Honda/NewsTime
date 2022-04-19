//
//  MostViewedViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class MostViewedViewController: UIViewController {
    private enum Constants {
        static let tabBarTag = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: Constants.tabBarTag)
    }
}
