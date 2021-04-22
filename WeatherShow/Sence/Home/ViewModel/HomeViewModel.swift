//
//  HomeViewModel.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import Combine

class HomeViewModel{
    
    // Mark: - Properties
    var service : HomeRepositoryProtocol
    var dataModel : HomeModel?
    
    typealias FetchCompletion = (Result<Data, Error>) -> Void

    
    
    weak var HomeDelegate:HomeDelegate?
    var today: String?
    
    init(service: HomeRepositoryProtocol = HomeRepositoryImp()) {
        today = Date().getToday()
        self.service = service
    }
    
    func startEngine(){
        
        HomeDelegate?.RenderUI()
        
        
        HomeDelegate?.updatingData()
        DispatchQueue.main.async {
            self.LoadData { (success) in
                if success {
                    self.HomeDelegate?.dataUpdated()
                }else{
                    self.HomeDelegate?.invalidData()
                }
            }
        }
    }    
    
    func LoadData(completion: @escaping (Bool) -> Void){
        service.RequestWeather { (Result) in
            switch Result{
                case .success(let data):
                    self.dataModel = self.DecodeAndUpdateData(data: data)
                    completion(true)
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(false)
            }
        }
    }
    
    // Mark: - Decode Profile Data And Update Status
    func DecodeAndUpdateData(data: Data) -> HomeModel{
        print(data.debugDescription)
        do{
            let response = try? JSONDecoder().decode(HomeModel.self, from: data)
            return response!
        }
    }
}
