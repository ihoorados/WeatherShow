//
//  ServiceNetworkLayer.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation


struct ServiceNetworkLayer{
    var tools : ServiceNetworkTools = {
        let tools = ServiceNetworkTools()
        return tools
    }()
}

extension ServiceNetworkLayer : ServiceProtocol {
    
    func DataTask(_ request: HTTPRequest, completion: @escaping (Data?, Error?) -> Void) {
        do{
            let TaskRequest = try tools.configureRequestForDataTask(request)
            tools.StartDataTaskWith(TaskRequest) { (data, error) in
                completion(data,error)
            }
        }catch{ completion(nil,HTTPNetworkError.badRequest) }
    }
}
