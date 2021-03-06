//
//  UIViewExtension.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import UIKit

extension UIView{
    
    func addConstraintsWithFormatString(formate: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
