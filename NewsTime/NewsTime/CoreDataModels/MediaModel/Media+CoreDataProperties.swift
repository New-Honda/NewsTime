//
//  Media+CoreDataProperties.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//
//

import Foundation
import CoreData

extension Media {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media> {
        return NSFetchRequest<Media>(entityName: "Media")
    }

    @NSManaged public var copyright: String?
    @NSManaged public var medias: Set<MediaMetaData>?

}

// MARK: Generated accessors for medias
extension Media {
    @objc(addMediasObject:)
    @NSManaged public func addToMedias(_ value: MediaMetaData)

    @objc(removeMediasObject:)
    @NSManaged public func removeFromMedias(_ value: MediaMetaData)

    @objc(addMedias:)
    @NSManaged public func addToMedias(_ values: NSSet)

    @objc(removeMedias:)
    @NSManaged public func removeFromMedias(_ values: NSSet)

}

extension Media: Identifiable {}
