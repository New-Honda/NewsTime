//
//  MostViewedDataProviderProtocol.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Alamofire

protocol MostViewedDataProviderProtocol {
    func loadMostViewedNews(completion: @escaping (Result<ContentModel, AFError>) -> Void)
}
