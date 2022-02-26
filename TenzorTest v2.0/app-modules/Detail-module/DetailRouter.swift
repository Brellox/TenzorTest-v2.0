//
//  DetailRouter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class DetailRouter: DetailRouterProtocol {
    
    weak var viewController: DetailViewController!
    
    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
}
