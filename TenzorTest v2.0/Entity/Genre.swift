//
//  Genre.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

struct Genre: Codable {

    var id: Int
    var name: String

    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

struct GenresResponse: Codable{
    var genres: [Genre]
    
    private enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
}
