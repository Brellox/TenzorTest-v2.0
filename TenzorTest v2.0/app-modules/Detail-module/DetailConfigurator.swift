//
//  DetailConfigurator.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class DetailConfigurator: DetailConfiguratorProtocol {
    
    func configure(with viewController: DetailViewController) {
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = DetailApiModule(_delegate: viewController)
    }
}
