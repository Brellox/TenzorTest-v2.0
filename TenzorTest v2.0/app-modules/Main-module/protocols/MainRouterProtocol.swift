//
//  MovieCollectionRouterProtocol.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import Foundation

protocol MainRouterProtocol:AnyObject {
    func goToDetails(movie: Movie)
    func chooseGenre()
}
