//
//  MovieCollectionInteractor.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    var apiManager: MainApiModule?
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getMovies(genre: Int, page: Int){
        self.apiManager?.getMovies(genre: genre, page: page)
    }
}
