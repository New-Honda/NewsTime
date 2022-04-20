//
//  ViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class NewsTabBarController: UITabBarController {
    private enum Constants {
        static let emailedTabBarTag = 0
        static let emailedTabBarTitle = "Most Emailed"
        static let emailedTabBarImageName = "mail"

        static let sharedTabBarTag = 1
        static let sharedTabBarTitle = "Most Shared"
        static let sharedTabBarImageName = "square.and.arrow.up.on.square"

        static let viewedTabBarTag = 2

        static let favoriteTabBarTag = 3
    }
    
    private let mostViewedViewController: NewsViewController = {
        let mostViewedViewModel = MostViewedViewModel()
        let viewController = NewsViewController(with: mostViewedViewModel)
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: Constants.viewedTabBarTag)
        return viewController
    }()

    private let mostSharedViewController: NewsViewController = {
        let mostSharedViewModel = MostSharedViewModel()
        let viewController = NewsViewController(with: mostSharedViewModel)
        viewController.tabBarItem = UITabBarItem(title: Constants.sharedTabBarTitle,
                                                 image: UIImage(systemName: Constants.sharedTabBarImageName),
                                                 tag: Constants.sharedTabBarTag)
        return viewController
    }()

    private let mostEmailedViewController: NewsViewController = {
        let mostEmailedPresenter = MostEmailedViewModel()
        let viewController = NewsViewController(with: mostEmailedPresenter)
        viewController.tabBarItem = UITabBarItem(title: Constants.emailedTabBarTitle,
                                                 image: UIImage(systemName: Constants.emailedTabBarImageName),
                                                 tag: Constants.emailedTabBarTag)
        return viewController
    }()

//    private let favoriteViewController: NewsViewController = {
//        let viewController = NewsViewController()
//        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: Constants.favoriteTabBarTag)
//        return viewController
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewControllers([mostViewedViewController,
                           mostSharedViewController,
                           mostEmailedViewController,
//                           favoriteViewController
                           ], animated: false)
    }
}
