//
//  Services.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation

struct ServiceController {
    
    // Mark: - Properties
    var ServiceShared : ServiceNetworkLayer = {
        let service = ServiceNetworkLayer()
        return service
    }()
    
    // Mark: - Api List
    var Request : HTTPRequest {
        var feedRequest = HTTPRequest()
        feedRequest.method = HTTPMethod.get.rawValue
        feedRequest.path = "/data/2.5/weather?q=Tehran&appid=8110abec2c686cca32a15eb9a6dc1553"
        feedRequest.scheme = "https"
        feedRequest.host = "api.openweathermap.org"
        feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
        return feedRequest
    }
    
    func RequestWeather(completion: @escaping (Data?, Error?) -> Void){
        ServiceShared.DataTask(Request) { (data, err) in
            completion(data,err)
        }
    }
    
    
}

