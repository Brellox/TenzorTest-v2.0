//
//  GenrePresenter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

class GenrePresenter: GenrePresenterProtocol {
    
    weak var view: GenreViewProtocol!
    var interactor: GenreInteractorProtocol!
    var router: GenreRouterProtocol!
    
    var genres: [Genre] = []
    
    required init(view: GenreViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    
    func getGenres(){
        self.interactor.getGenres()
    }
}
