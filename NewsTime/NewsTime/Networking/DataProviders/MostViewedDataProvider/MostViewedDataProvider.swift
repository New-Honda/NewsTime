//
//  MostViewedDataProvider.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

final class MostViewedDataProvider: MostViewedDataProviderProtocol {
    private let networkManager: NetworkManagerProtocol = NetworkManager()

    func loadMostViewedNews(completion: @escaping (Result<ContentModel, AFError>) -> Void) {
        let path = networkManager.baseUrl + "/viewed/30.json"

        guard let url = URL(string: path) else {
            completion(.failure(.invalidURL(url: path)))
            return
        }

        networkManager.loadData(url: url, completion: completion)
    }
}
