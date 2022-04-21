//
//  CoreDataProvider.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//

import UIKit

final class CoreDataProvider {
    static let shared = CoreDataProvider()
    private init() {}

    // swiftlint:disable force_cast
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private var complitions = [() -> Void]()

    private func runComplitions() {
        complitions.forEach { complition in
            complition()
        }
    }

    func addComplition(_ complition: @escaping () -> Void) {
        complitions.append(complition)
    }

    func getData() -> [ArticleModel] {
        var articleModels = [ArticleModel]()
        do {
            let fetchedArticles = try context.fetch(Article.fetchRequest())
            fetchedArticles.forEach { article in
                guard let articleData = article.getArticleModel() else { return }
                articleModels.append(articleData)
            }
        } catch {
            NSLog("getData error")
        }

        return articleModels
    }

    func setData(article: ArticleModel) {
        for item in getData() {
            guard item.id != article.id else { return }
        }
        let articleData = Article(context: context)
        articleData.id = Int64(article.id)
        articleData.publishedDate = article.publishedDate
        articleData.abstract = article.abstract
        articleData.byLine = article.byLine
        articleData.url = article.url
        articleData.title = article.title
        articleData.section = article.section

        article.media.forEach { media in
            let mediaData = Media(context: context)
            mediaData.copyright = media.copyright
            media.medias.forEach { meta in
                let metaData = MediaMetaData(context: context)
                metaData.setMediaMetaData(mediaMetaDataModel: meta)
                mediaData.addToMedias(metaData)
            }
            articleData.addToMedis(mediaData)
        }
        do {
            try context.save()
            runComplitions()
        } catch {
            NSLog("SetData error")
        }
    }

    func deleteData(article: ArticleModel) {
        do {
            let fetchedArticles = try context.fetch(Article.fetchRequest())
            fetchedArticles.forEach { item in
                if item.id == article.id {
                    context.delete(item)
                }
            }
            if context.hasChanges {
                try context.save()
            }
        } catch {
            NSLog("DeleteData error")
        }
    }
}
