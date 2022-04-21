//
//  Media+CoreDataClass.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 21.04.2022.
//
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject {
    func getMediaModel() -> MediaModel? {
        guard let copyright = copyright else { return nil }
        var metaMedias = [MediaMetaDataModel]()
        medias?.forEach { media in
            guard let data = media.getMediaMetaDataModel() else { return }
            metaMedias.append(data)
        }
        metaMedias = metaMedias.sorted { firstItem, secondItem in
            if firstItem.height < secondItem.height {
                return true
            } else { return false }
        }
        return MediaModel(copyright: copyright,
                          medias: metaMedias)
    }

    func setMedia(mediaModel: MediaModel) {
        copyright = mediaModel.copyright
        mediaModel.medias.forEach { mediaData in
            let mediaMetaData = MediaMetaData()
            mediaMetaData.setMediaMetaData(mediaMetaDataModel: mediaData)
            addToMedias(mediaMetaData)
        }
    }
}
