//
//  MostSharedViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class MostSharedViewController: UIViewController {
    private enum Constants {
        static let tabBarTag = 1
        static let tabBarTitle = "Most Shared"
        static let tabBarImageName = "square.and.arrow.up.on.square"
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
        tabBarItem = UITabBarItem(title: Constants.tabBarTitle,
                                  image: UIImage(systemName: Constants.tabBarImageName),
                                  tag: Constants.tabBarTag)
    }
}
