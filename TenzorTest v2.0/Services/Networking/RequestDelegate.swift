//
//  RequestDelegate.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

protocol RequestManagerDelegate: AnyObject {
    func error_back(message: String)
    func result_data(data: Data)
}
