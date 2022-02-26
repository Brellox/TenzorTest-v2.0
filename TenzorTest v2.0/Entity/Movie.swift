//
//  Movie.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

struct Movie: Codable {
    var adult: Bool
    var backdrop_path: String?
    var genre_idsarray: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String?
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_idsarray = "genre_ids"
        case id = "id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
}

struct MovieResponse: Codable{
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}
