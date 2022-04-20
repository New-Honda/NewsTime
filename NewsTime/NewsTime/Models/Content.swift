//
//  Content.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

struct Content: Decodable {
    var status: String
    var resultCount: Int
    var results: [Article]

    enum CodingKeys: String, CodingKey {
        case status
        case resultCount = "num_results"
        case results
    }
}
