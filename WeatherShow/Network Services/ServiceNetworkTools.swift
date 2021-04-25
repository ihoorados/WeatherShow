//
//  ServiceNetworkTools.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation

protocol ServiceToolsProtocol {
    typealias fetchResult = (Result<Data, Error>) -> Void
    func StartDataTaskWith(_ request:URLRequest, completion:@escaping fetchResult)
    func configureRequestForDataTask(_ HTTPRequest:HTTPRequest) throws -> URLRequest
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}


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
            throw HTTPNetworkError.parametersNil
        }
        
        guard let parameterfeilds = parameter else {
            throw HTTPNetworkError.parametersNil
        }
        // add parameter
        for (key,value) in parameterfeilds {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        items = items.filter{ !$0.name.isEmpty }
        guard let urlCompQueryItems = httpRequest.urlComp else {
            throw HTTPNetworkError.missingURL
        }
        if !items.isEmpty {
            urlCompQueryItems.queryItems = items
        }
        
        guard let url = urlCompQueryItems.url else {
            throw HTTPNetworkError.missingURL
        }
        
        // make request
        request = URLRequest(url: url)
        request.httpMethod = httpRequest.method
        return request
    }
    
    
    private func ValidateResponse(_ Response: HTTPURLResponse?, _ data: Data?) throws -> Data {
        guard let response = Response else { throw HTTPNetworkError.noData }
        switch response.statusCode {
        case 400:
            throw HTTPNetworkError.badRequest
        default:
            break
        }
        guard let data = data else { throw HTTPNetworkError.noData }
        return data
    }

    
    func StartDataTaskWith(_ request: URLRequest, completion: @escaping fetchResult) {
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            do{
                if let error = error { completion(.failure(error))}
                let data = try self.ValidateResponse(response as? HTTPURLResponse,data)
                completion(.success(data))
            }catch let err{
                completion(.failure(err))
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

    

    
    
}
