//
//  MostEmailedDataProvider.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

final class MostEmailedDataProvider: MostEmailedDataProviderProtocol {
    private let networkManager: NetworkManagerProtocol = NetworkManager()

    func loadMostEmailedNews(completion: @escaping (Result<Content, AFError>) -> Void) {
        let path = networkManager.baseUrl + "/emailed/30.json"

        guard let url = URL(string: path) else {
            completion(.failure(.invalidURL(url: path)))
            return
        }

        networkManager.loadData(url: url, completion: completion)
    }
}
