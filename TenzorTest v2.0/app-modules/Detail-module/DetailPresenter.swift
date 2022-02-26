//
//  DetailPresenter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol!
    var interactor: DetailInteractorProtocol!
    var router: DetailRouterProtocol!
    
    var cast: [Cast] = []
    var crew: [Crew] = []
    
    required init(view: DetailViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    
    func getMembers(movie: Int){
        self.interactor.getMembers(movie: movie)
    }
}
