//
//  GenrePresenterProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

protocol GenrePresenterProtocol:AnyObject {
    
    var router: GenreRouterProtocol! {set get}
    func configureView()
    var genres: [Genre]{get set}
    func getGenres()
}
