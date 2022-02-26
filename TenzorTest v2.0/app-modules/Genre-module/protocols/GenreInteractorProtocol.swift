//
//  GenreInteractorProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

protocol GenreInteractorProtocol:AnyObject {

    var apiManager: GenreApiModule?{get set}
    func getGenres()
}
