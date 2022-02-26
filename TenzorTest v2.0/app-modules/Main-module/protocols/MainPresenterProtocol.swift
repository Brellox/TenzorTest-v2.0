//
//  MovieCollectionPresenterProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

protocol MainPresenterProtocol:AnyObject {
    
    var router: MainRouterProtocol! {set get}
    func configureView()
    var dataArray: [Movie] {get set}
    var maxPages: Int {get set}
    var currentPage: Int{get set}
    var currentGenre: Int{get set}
    func getMovies(genre: Int)
}
