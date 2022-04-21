//
//  FavoritesViewModel.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//

import UIKit

class FavoritesViewModel: NewsViewModelProtocol {
    var newsViewDelegate: NewsViewDelegate?

    func loadNews() {
        let articleModels = CoreDataProvider.shared.getData()
        DispatchQueue.main.async {
            self.newsViewDelegate?.updateDataSource(with: articleModels)
        }
    }

    init() {
        CoreDataProvider.shared.addComplition { [weak self] in
            DispatchQueue.main.async {
                self?.loadNews()
            }
        }
    }

    func favoriteButtonHandler(article: ArticleModel) {
        CoreDataProvider.shared.deleteData(article: article)
        loadNews()
    }
}
