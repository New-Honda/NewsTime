//
//  MostViewedViewModel.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Foundation

class MostViewedViewModel: NewsViewModelProtocol {
    weak var newsViewDelegate: NewsViewDelegate?

    private let container = DIContainer.shared
    private var mostViewedDataProvider: MostViewedDataProviderProtocol {
        container.resolve(type: MostViewedDataProvider.self)
    }

    func loadNews() {
        newsViewDelegate?.startSpinner()
        mostViewedDataProvider.loadMostViewedNews { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.newsViewDelegate?.updateDataSource(with: data.results)
                }
            case .failure(let error):
                self?.newsViewDelegate?.errorAlert(message: error.localizedDescription)
            }
            self?.newsViewDelegate?.stopSpinner()
        }
    }

    func favoriteButtonHandler(article: ArticleModel) {
        CoreDataProvider.shared.setData(article: article)
    }
}
