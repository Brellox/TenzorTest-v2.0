//
//  GenreConfigurator.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

class GenreConfigurator: GenreConfiguratorProtocol {
    
    func configure(with viewController: GenreViewController) {
        let presenter = GenrePresenter(view: viewController)
        let interactor = GenreInteractor(presenter: presenter)
        let router = GenreRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = GenreApiModule(_delegate: viewController)
    }
}
