//
//  MainApiDelegate.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

protocol MainApiDelegate: AnyObject{
    func MovieResult(list: [Movie], maxPages: Int)
}
