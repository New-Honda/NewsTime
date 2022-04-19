//
//  MediaMetadata.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import Foundation

struct MediaMetadata: Decodable {
    var url: String
    var formate: String
    var height: Int
    var width: Int
}
