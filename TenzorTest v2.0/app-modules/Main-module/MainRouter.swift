//
//  MovieCollectionRouter.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func goToDetails(movie: Movie){
        let dVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        dVC.movie = movie
        self.viewController.navigationController?.pushViewController(dVC, animated: true)
    }
    
    func chooseGenre(){
        let gVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "GenreViewController") as! GenreViewController
        gVC.delegate = self.viewController
        self.viewController.navigationController?.pushViewController(gVC, animated: true)
    }
}
