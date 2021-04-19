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
    
    // Mark: - Create Custom Request
    var Request : HTTPRequest {
        var feedRequest = HTTPRequest()
        feedRequest.method = HTTPMethod.get.rawValue
        feedRequest.urlComp = NSURLComponents(string: "https://api.openweathermap.org/data/2.5/weather")!
        feedRequest.parameter =  ["q" : "london","appid":"8110abec2c686cca32a15eb9a6dc1553"]
        return feedRequest
    }
    
    // Mark: - request
    func RequestWeather(completion: @escaping (Result<Data, Error>) -> Void){
        ServiceShared.DataTask(Request) { (Result) in
            completion(Result)
        }
    }
}

