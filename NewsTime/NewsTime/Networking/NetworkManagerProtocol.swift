//
//  NetworkManagerProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

protocol NetworkManagerProtocol {
    var baseUrl: String { get }
    func loadData<T: Decodable>(url: URL,
                                completion: @escaping (Result<T, AFError>) -> Void)
}
