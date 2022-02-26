//
//  DetailInteractor.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol!
    var apiManager: DetailApiModule?
    required init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getMembers(movie: Int){
        self.apiManager?.getMembers(movie: movie)
    }

}
