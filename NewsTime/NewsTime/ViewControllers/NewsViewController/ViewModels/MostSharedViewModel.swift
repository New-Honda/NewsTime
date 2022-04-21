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
        mostSharedDataProvider.loadMostSharedNews { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.newsViewDelegate?.updateDataSource(with: data.results)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func favoriteButtonHandler(article: ArticleModel) {
        CoreDataProvider.shared.setData(article: article)
    }
}
