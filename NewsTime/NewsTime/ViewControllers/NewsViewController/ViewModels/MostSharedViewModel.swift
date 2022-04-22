//
//  MostSharedViewModel.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Foundation

class MostSharedViewModel: NewsViewModelProtocol {
    weak var newsViewDelegate: NewsViewDelegate?

    private let container = DIContainer.shared
    private var mostSharedDataProvider: MostSharedDataProviderProtocol {
        container.resolve(type: MostSharedDataProvider.self)
    }

    func loadNews() {
        newsViewDelegate?.startSpinner()
        mostSharedDataProvider.loadMostSharedNews { [weak self] result in
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
