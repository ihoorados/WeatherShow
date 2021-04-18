//
//  HomeRepository.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 4/19/21.
//

import Foundation

import Foundation
import Network

protocol HomeRepositoryProtocol {
    typealias FetchCompletion = (Result<Data, Error>) -> Void
    func RequestWeather(completion: @escaping FetchCompletion)
}

struct HomeRepositoryImp: HomeRepositoryProtocol {
    
    // Mark: - Properties
    var interactor : ServiceController
    
    init(interactor: ServiceController = ServiceController()) {
        self.interactor = interactor
    }
    
    func RequestWeather(completion: @escaping FetchCompletion){
        persistorFetch(completion)
    }
    
}

private extension HomeRepositoryImp {
    
    func persistorFetch(_ completion: @escaping FetchCompletion) {
    }
    
}
