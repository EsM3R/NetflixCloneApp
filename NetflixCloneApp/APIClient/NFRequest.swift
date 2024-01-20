//
//  NFRequest.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation

fileprivate struct Constants{
    public static let BASE_URL = "https://api.themoviedb.org/3/"
    public static let API_KEY =  "7f56b69537b7c0cfc23a43f0b13442af"

}

enum ServicePath : String{
    
    case NEW_AND_HOT = "movie/upcoming"
    case TRENDING_MOVIE =  "trending/movie/day"
    case TRENDING_TV = "trending/tv/day"
    case POPULAR = "movie/popular"
    case TOP_RATED = "movie/top_rated"
    
}



extension ServicePath {
    func withBaseUrl() -> String{
        return "\(Constants.BASE_URL)\(self.rawValue)?api_key=\(Constants.API_KEY)"
    }
}
