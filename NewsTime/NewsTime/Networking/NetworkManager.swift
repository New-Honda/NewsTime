//
//  NetworkManager.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

final class NetworkManager: NetworkManagerProtocol {
    private let accessToken = "5kpiS98wmgNaOmm0MDAK1amNTEUelLUq"
    private let parameterName = "api-key"
    let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2"

    func loadData<T: Decodable>(url: URL,
                                completion: @escaping (Result<T, AFError>) -> Void) {
        guard var urlComponents = URLComponents(string: url.absoluteString) else { return }
        let accessQuerryItem = URLQueryItem(name: parameterName,
                                            value: accessToken)
        urlComponents.queryItems = [accessQuerryItem]
        let request = AF.request(urlComponents)
        request.responseDecodable(of: T.self) { response in
            completion(response.result)
        }
    }
}
