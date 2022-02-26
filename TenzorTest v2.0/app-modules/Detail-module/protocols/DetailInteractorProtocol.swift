//
//  DetailInteractorProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

protocol DetailInteractorProtocol:AnyObject {

    var apiManager: DetailApiModule?{get set}
    func getMembers(movie: Int)
}

