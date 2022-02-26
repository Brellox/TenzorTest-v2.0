//
//  MainApiModule.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation
class MainApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: MainApiDelegate?
    private var requestManager: RequestManager
    
    init(_delegate: MainApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    func getMovies(genre: Int, page: Int){
        requestManager.get(method: "discover/movie?api_key=\(Keys.api_key)&language=en-US&sort_by=popularity.desc&include_video=false&with_watch_monetization_types=free&with_genres=\(genre)&page=\(page)") { _data in
            if let movies = try? self.decoder.decode(MovieResponse.self, from: _data){
                self.delegate?.MovieResult(list: movies.results, maxPages: movies.total_pages)
            }
        }
    }

    
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}
