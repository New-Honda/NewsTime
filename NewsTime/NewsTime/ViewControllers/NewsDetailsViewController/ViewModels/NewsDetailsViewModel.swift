//
//  NewsDetailsViewModel.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Foundation

class NewsDetailsViewModel: NewsDetailsViewModelProtocol {
    weak var viewDelegate: NewsDetailsViewDelegate?
    private let urlPath: String

    init(urlPath: String) {
        self.urlPath = urlPath
    }

    func loadPage() {
        guard let url = URL(string: urlPath) else { return }
        let urlRequest = URLRequest(url: url)
        viewDelegate?.loadData(request: urlRequest)
    }
}
