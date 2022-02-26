//
//  MovieCollectionPresenter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    var dataArray: [Movie] = []
    var maxPages: Int = 10
    var currentPage: Int = 1
    var currentGenre: Int = 0
    
    required init(view: MainViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    

    
    func getMovies(genre: Int){
        if currentPage <= maxPages {
            self.interactor.getMovies(genre: genre, page: currentPage)
        }
    }
}


