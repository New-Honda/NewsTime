//
//  Article+CoreDataClass.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    func getArticleModel() -> ArticleModel? {
        guard let url = url,
              let section = section,
              let byLine = byLine,
              let title = title,
              let abstract = abstract,
              let publishedDate = publishedDate,
              let medis = medis else { return nil }
        var mediaModel = [MediaModel]()
        medis.forEach { media in
            guard let mediaData = media.getMediaModel() else { return }
            mediaModel.append(mediaData)
        }
        return ArticleModel(id: Int(id),
                            url: url,
                            section: section,
                            byLine: byLine,
                            title: title,
                            abstract: abstract,
                            publishedDate: publishedDate,
                            media: mediaModel)
    }
}
