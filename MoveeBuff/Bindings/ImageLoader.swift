//
//  ImageLoader.swift
//  MoveeBuff
//
//  Created by Joe Vargas on 7/21/21.
//

import Foundation
import UIKit

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        
        // Retrieve image from cache. If the image exists, assign it to the image property
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        // If the image doesn't exist in cache, download from image url
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let self = self else {return}
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                // set downloaded image to image cache
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    // set downloaded and cached image to image property
                    self?.image = image
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
