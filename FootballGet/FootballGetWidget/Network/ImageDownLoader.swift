//
//  ImageDownLoader.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/26.
//

import UIKit
import Combine
import Kingfisher

final class ImageDownloader {
    
    func download(_ url: String, completion: @escaping (AnyPublisher<UIImage, Never>)->()) {
        guard let url = URL(string: url) else { return }
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                completion(Just(value.image as UIImage).eraseToAnyPublisher())
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func downloadWithPublisher(_ url: String) -> AnyPublisher<UIImage, Error> {
        guard let url = URL(string: url) else { return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher() }
        
        let publisher = PassthroughSubject<UIImage, Error>()
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                let image = value.image as UIImage
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
                    publisher.send(image)
                }
            case .failure(let error):
                print(error)
            }
        }

        return publisher.eraseToAnyPublisher()
    }
}
