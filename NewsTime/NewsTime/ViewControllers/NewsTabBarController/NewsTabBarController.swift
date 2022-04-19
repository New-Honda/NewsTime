//
//  ViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class NewsTabBarController: UITabBarController {
    private let mostViewedViewController = MostViewedViewController()
    private let mostSharedViewController = MostSharedViewController()
    private let mostEmailedViewController = MostEmailedViewController()
    private let favoriteViewController = FavoriteViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewControllers([mostViewedViewController,
                           mostSharedViewController,
                           mostEmailedViewController,
                           favoriteViewController], animated: false)
    }
}
