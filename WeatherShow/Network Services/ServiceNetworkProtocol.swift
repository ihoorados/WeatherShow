//
//  ServiceNetworkProtocol.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation

protocol ServiceProtocol {
    func DataTask(_ request: HTTPRequest,completion: @escaping(Data?, Error?) -> Void)
}
protocol ServiceToolsProtocol {
    func configureRequestForDataTask(_ HTTPRequest:HTTPRequest) throws -> URLRequest
    func ValidateResponse(_ Response:HTTPURLResponse?,_ data:Data?) throws -> Data
    func StartDataTaskWith(_ request:URLRequest, completion:@escaping(Data?,Error?) -> Void)
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}
