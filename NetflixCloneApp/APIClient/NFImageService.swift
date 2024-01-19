//
//  NFImageServic.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation

protocol NFImageServiceProtocol{
    func fetchImage(imageUrl : String? ,completion: @escaping (Result<Data, Error>) -> Void)
}

enum  NFImageRequest : String{
     case  BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500"
}


final class NFImageService : NFImageServiceProtocol{
    
    public static let  shared =  NFImageService()
    
    private init(){}
    
    func fetchImage(imageUrl : String? ,completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = imageUrl else {return}
        
        let imageUrlString = NFImageRequest.BASE_IMAGE_URL.rawValue + url
            
    
        guard let request = URL(string: imageUrlString) else {return}
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else {return}
            completion(.success(data))
        }
        task.resume()
        
        
    }
    
    
}
