//
//  Movie.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation


struct NFMovieModel: Codable {
    
    let adult: Bool?
    let backdrop_path: String?
    let id: Int
    let title : String?
    let original_language : String?
    let original_title : String?
    let overview: String?
    let poster_path : String?
    let media_type: String?
    let genre_ids: [Int]?
    let popularity: Double?
    let release_date: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}


