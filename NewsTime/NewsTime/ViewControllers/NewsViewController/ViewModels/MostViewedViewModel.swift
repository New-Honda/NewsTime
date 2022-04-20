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
        mostViewedDataProvider.loadMostViewedNews { result in
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
