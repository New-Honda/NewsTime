//
//  Media.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import Foundation

struct Media: Decodable {
    var type: String
    var subtype: String
    var caption: String
    var copyright: String
    var medias: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case medias = "media-metadata"
    }
}
