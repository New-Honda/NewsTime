//
//  CoreDataProvider.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//

import UIKit
import CoreData

final class CoreDataProvider {
    static let shared = CoreDataProvider()
    private init() {}

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "NewsTime")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

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

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
