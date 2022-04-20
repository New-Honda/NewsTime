//
//  Article.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

struct Article: Decodable, Hashable {
    var id: Int
    var url: String
    var section: String
    var byLine: String
    var type: String
    var title: String
    var abstract: String
    var publishedDate: String
    var source: String
    var keywords: [String]
    var media: [Media]

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case section
        case byLine = "byline"
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case keywords = "des_facet"
        case media
    }
}
