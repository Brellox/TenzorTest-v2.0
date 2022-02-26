//
//  CastMember.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

struct Cast: Codable{
    var adult: Bool
    var gender: Int?
    var id: Int
    var known_for_department:String
    var name: String
    var original_name: String
    var popularity: Double
    var profile_path:String?
    var cast_id: Int
    var character: String
    var credit_id:String
    var order: Int

    
    private enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case cast_id = "cast_id"
        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
    }
}

struct Crew: Codable{
    var adult: Bool
    var gender: Int?
    var id: Int
    var known_for_department:String
    var name: String
    var original_name: String
    var popularity: Double
    var profile_path:String?
    var credit_id:String
    var department: String
    var job: String
    
    private enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case credit_id = "credit_id"
        case department = "department"
        case job = "job"
    }
}

struct MemberResponse: Codable{
    var id: Int
    var cast: [Cast]
    var crew: [Crew]
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }
}
