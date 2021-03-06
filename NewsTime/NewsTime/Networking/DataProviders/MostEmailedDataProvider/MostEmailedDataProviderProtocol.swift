//
//  MostEmailedDataProviderProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

protocol MostEmailedDataProviderProtocol {
    func loadMostEmailedNews(completion: @escaping (Result<ContentModel, AFError>) -> Void)
}
