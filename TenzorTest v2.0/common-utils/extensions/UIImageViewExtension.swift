//
//  UIImageViewExtension.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import UIKit


extension UIImageView {
    func setImage(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: Keys.poster_url+url)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

