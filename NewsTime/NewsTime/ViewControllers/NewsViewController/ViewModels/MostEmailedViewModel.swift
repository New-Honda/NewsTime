//
//  MostEmailedPresenter.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Foundation

class MostEmailedViewModel: NewsViewModelProtocol {
    weak var newsViewDelegate: NewsViewDelegate?

    private let container = DIContainer.shared
    private var mostEmailedDataProvider: MostEmailedDataProviderProtocol {
        container.resolve(type: MostEmailedDataProvider.self)
    }

    func loadNews() {
        mostEmailedDataProvider.loadMostEmailedNews { result in
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
}
