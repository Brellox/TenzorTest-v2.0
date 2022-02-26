//
//  GenreRouter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

class GenreRouter: GenreRouterProtocol {
    
    weak var viewController: GenreViewController!
    
    init(viewController: GenreViewController) {
        self.viewController = viewController
    }
    
    func goToMovies(){
        self.viewController.navigationController?.popToRootViewController(animated: true)
    }
}
