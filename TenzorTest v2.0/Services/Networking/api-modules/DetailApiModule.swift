//
//  DetailApiModule.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation
class DetailApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: DetailApiDelegate?
    private var requestManager: RequestManager
    
    init(_delegate: DetailApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    func getMembers(movie: Int){
        requestManager.get(method: "movie/\(movie)/credits?api_key=\(Keys.api_key)&language=en-US") { _data in
            if let members = try? self.decoder.decode(MemberResponse.self, from: _data){
                self.delegate?.MemberResult(cast: members.cast, crew: members.crew)
            }
        }
    }
    


    
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}

