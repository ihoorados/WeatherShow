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


protocol ServiceProtocol {
    typealias fetchResult = (Result<Data, Error>) -> Void
    func DataTask(_ request: HTTPRequest,completion: @escaping fetchResult)
}

extension ServiceNetworkLayer : ServiceProtocol {
    
    func DataTask(_ request: HTTPRequest, completion: @escaping fetchResult) {
        do{
            // create URLRequest
            let TaskRequest = try tools.configureRequestForDataTask(request)
            // Start new task with Task Request
            tools.StartDataTaskWith(TaskRequest) { (Result) in
                completion(Result)
            }
        }catch{
            completion(.failure(HTTPNetworkError.badRequest))
        }
    }
}
