//
//  ServiceNetworkTools.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation


struct ServiceNetworkTools : ServiceToolsProtocol {

            
    // Create a session for a URLSession
    var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    func configureRequestForDataTask(_ httpRequest: HTTPRequest) throws -> URLRequest {
        
        var request: URLRequest
        var items = [URLQueryItem]()
        
        // Validate Parameter
        guard let parameter = httpRequest.parameter else {
            throw HTTPNetworkError.headersNil
        }
        guard let parameterfeilds = parameter else {
            throw HTTPNetworkError.headersNil
        }
        
        // add parameter
        for (key,value) in parameterfeilds {
            items.append(URLQueryItem(name: key, value: value))
        }
        items = items.filter{!$0.name.isEmpty}
        guard let urlCompQueryItems = httpRequest.urlComp else {
            throw HTTPNetworkError.headersNil
        }
        if !items.isEmpty {
            urlCompQueryItems.queryItems = items
        }
        
        // make request
        request = URLRequest(url: urlCompQueryItems.url!)
        request.httpMethod = "GET"
        return request
        
    }
    

    
    func StartDataTaskWith(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            do{
                if let error = error { completion(nil,error)}
                let data = try self.ValidateResponse(response as? HTTPURLResponse,data)
                completion(data,nil)
            }catch let err{
                completion(nil,err)
            }
        })
        task.resume()
        
    }
    
    func JSONSerializationWith(_ data: Data, completion: @escaping([String:Any]?, Error?) -> Void) {
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                completion(json,nil)
            }
        } catch let error as NSError {
            completion(nil,error)
        }
        
    }

    
    func ValidateResponse(_ Response: HTTPURLResponse?, _ data: Data?) throws -> Data {
        guard let response = Response else { throw HTTPNetworkError.badRequest }
        switch response.statusCode {
        case 400:
            throw HTTPNetworkError.badRequest
        default:
            break
        }
        guard let data = data else { throw HTTPNetworkError.noData }
        return data
    }
    
    func getURL(scheme:String,path:String,host:String) -> URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        return component.url
    }
    
    
}
