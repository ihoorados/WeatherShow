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
        
        guard let method = httpRequest.method  else {
            throw HTTPNetworkError.failed
        }
        guard let scheme = httpRequest.scheme else{
            throw HTTPNetworkError.missingURL
        }
        guard let host = httpRequest.host else{
            throw HTTPNetworkError.missingURL
        }
        guard let path = httpRequest.path else {
            throw HTTPNetworkError.missingURL
        }
        guard let url = getURL(scheme: scheme, path: path, host: host) else {
            throw HTTPNetworkError.missingURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method

        if httpRequest.headers != nil {
            
            guard let headers = httpRequest.headers else {
                throw HTTPNetworkError.headersNil
            }
            guard let headerfeilds = headers else {
                throw HTTPNetworkError.headersNil
            }
            request.allHTTPHeaderFields = headerfeilds
        }
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
