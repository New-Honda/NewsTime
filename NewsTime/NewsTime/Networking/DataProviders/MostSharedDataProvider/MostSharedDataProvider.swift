//
//  MostSharedDataProvider.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

final class MostSharedDataProvider: MostSharedDataProviderProtocol {
    private let networkManager: NetworkManagerProtocol = NetworkManager()

    func loadMostSharedNews(completion: @escaping (Result<Content, AFError>) -> Void) {
        let path = networkManager.baseUrl + "/shared/30.json"

        guard let url = URL(string: path) else {
            completion(.failure(.invalidURL(url: path)))
            return
        }

        networkManager.loadData(url: url, completion: completion)
    }
}
