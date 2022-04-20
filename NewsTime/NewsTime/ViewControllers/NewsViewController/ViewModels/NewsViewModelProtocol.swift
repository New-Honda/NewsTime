//
//  NewsPresenterProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

protocol NewsViewModelProtocol {
    var newsViewDelegate: NewsViewDelegate? { get set }
    func loadNews() -> Void
}
