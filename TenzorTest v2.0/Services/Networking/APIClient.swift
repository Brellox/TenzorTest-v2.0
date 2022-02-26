//
//  APIClient.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation

class APIClientBase{
    
    let decoder: JSONDecoder = JSONDecoder()
    
    func setDecoderBase64() {
        decoder.dataDecodingStrategy = .base64
    }
    
}
