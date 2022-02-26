//
//  RequestManager.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation


class RequestManager {
    
    weak var delegate: RequestManagerDelegate?
    let config = URLSessionConfiguration.default
    
    init(d: RequestManagerDelegate) {
        self.delegate = d
      //  self.config.protocolClasses?.insert(NetProtocol.self, at: 0)
        self.config.httpAdditionalHeaders = self.additionalHeaders
    }
    
    init(){
      //  self.config.protocolClasses?.insert(NetProtocol.self, at: 0)
        self.config.httpAdditionalHeaders = self.additionalHeaders
    }
    
    private let additionalHeaders = {
        return [
            "Accept": "application/json",
            "User-Agent": "",
            "cache-control": "no-cache"
        ]
    }()
    
    public enum HTTPMethod: String {
        case GET
    }
    
    private let build_main_url = { (method: String)-> URL in
        return URL(string: Keys.main_url + method)!
    }
    
    
    private func createRequest(url: URL, httpMethod: HTTPMethod) -> URLRequest{
        
        var request = URLRequest.init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func runTask(method: String, httpMethod: HTTPMethod = .GET, success_run: @escaping (Data) -> Void){
        let session = URLSession.init(configuration: config)
        var request: URLRequest = {
            return createRequest(url: build_main_url(method), httpMethod: httpMethod)
        }()
        
        
        let task = session.dataTask(with: request){(data, request, error) in
            do{
                if let d = data {
                    success_run(d)
                } else {

                }
                
            }catch{

            }
        }
        
        task.resume()
        
    }
    
    func get(method: String, success_run: @escaping (Data) -> Void){
        self.runTask(method: method, success_run: success_run)
    }
    
    
}

