//
//  MovieCollectionInteractorProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

protocol MainInteractorProtocol:AnyObject {
    
    var apiManager: MainApiModule?{get set}
    func getMovies(genre: Int, page: Int)
}
