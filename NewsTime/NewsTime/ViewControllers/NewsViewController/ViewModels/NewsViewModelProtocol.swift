//
//  NewsPresenterProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

protocol NewsViewModelProtocol {
    var newsViewDelegate: NewsViewDelegate? { get set }
    func loadNews()
}

extension NewsViewModelProtocol {
    func newsDetailsScreen(urlPath: String) -> UIViewController {
        let viewModel = NewsDetailsViewModel(urlPath: urlPath)
        let viewController = NewsDetailsViewController(with: viewModel)
        return viewController
    }
}
