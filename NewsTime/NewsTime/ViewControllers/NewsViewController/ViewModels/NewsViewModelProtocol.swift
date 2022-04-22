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
    func favoriteButtonHandler(article: ArticleModel)
}
