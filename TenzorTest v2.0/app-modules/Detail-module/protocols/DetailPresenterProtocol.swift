//
//  DetailPresenterProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

protocol DetailPresenterProtocol:AnyObject {
    
    var router: DetailRouterProtocol! {set get}
    func configureView()
    
    var cast: [Cast] {get set}
    var crew: [Crew] {get set}
    func getMembers(movie: Int)
}
