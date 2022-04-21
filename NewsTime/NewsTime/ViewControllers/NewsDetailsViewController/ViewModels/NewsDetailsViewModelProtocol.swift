//
//  NewsDetailsViewModelProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

protocol NewsDetailsViewModelProtocol {
    var viewDelegate: NewsDetailsViewDelegate? { get set }
    func loadPage()
}
