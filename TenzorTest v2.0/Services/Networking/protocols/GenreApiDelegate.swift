//
//  GenreApiDelegate.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

protocol GenreApiDelegate: AnyObject{
    func GenresResult(list: [Genre])
}
