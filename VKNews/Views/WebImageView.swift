//
//  WebImageView.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 16.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    
    private var currentUrlString: String?
    
    func set(imageURL: String?) {
        
        currentUrlString = imageURL
        
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
//            Если не получилось извлечь картинку, то nil
            self.image = nil
            return }
        
//        Если изображение по url уже хранится в кэше, то используем его, а не загружаем заново. И при перезагрузки приложения, фото будут браться по возможности из кэша.
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            print("from cache")
            return
        }
        
        print("from internet")
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
//            Процесс должен происходить в асинхронном потоке, так как изображение может быть слишком большим или интернет слишком медленным
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
//    кэширование изображений
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        
        if responseURL.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
    
}
