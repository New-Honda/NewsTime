//
//  MostSharedDataProviderProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

protocol MostSharedDataProviderProtocol {
    func loadMostSharedNews(completion: @escaping (Result<Content, AFError>) -> Void)
}
