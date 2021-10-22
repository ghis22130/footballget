//
//  ImageDataTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/21.
//

import Foundation
import Kingfisher

final class ImageDataDownLoader {
        
    func download(urls: [String], completion: @escaping ([Data])->() ) {
        let urls = urls.compactMap { URL(string: $0) }
        
        var data: [Data] = []
        
        ImagePrefetcher(urls: urls) { skippedResources, failedResources, completedResources in
            data = completedResources.compactMap {
                let image = ImageCache.default.retrieveImageInMemoryCache(forKey: $0.cacheKey)
                return image?.kf.data(format: .PNG)
            }
            
            completion(data)
        }.start()
    }
}
