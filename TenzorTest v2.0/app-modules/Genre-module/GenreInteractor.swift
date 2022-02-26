//
//  GenreInteractor.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

class GenreInteractor: GenreInteractorProtocol {
    
    weak var presenter: GenrePresenterProtocol!
    var apiManager: GenreApiModule?
    
    required init(presenter: GenrePresenterProtocol) {
        self.presenter = presenter
    }
    
    func getGenres(){
        self.apiManager?.getGenres()
    }

}
