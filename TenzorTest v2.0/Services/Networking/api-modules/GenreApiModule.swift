//
//  GenreApiModule.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation
class GenreApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: GenreApiDelegate?
    private var requestManager: RequestManager
    
    init(_delegate: GenreApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    func getGenres(){
        requestManager.get(method: "genre/movie/list?api_key=\(Keys.api_key)&language=en-US") { _data in
            if let genres = try? self.decoder.decode(GenresResponse.self, from: _data){
                self.delegate?.GenresResult(list: genres.genres)
            }
        }
    }
    


    
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}
