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
    weak var HomeDelegate:HomeDelegate?
    var today: String
    
    init(service: HomeRepositoryProtocol = HomeRepositoryImp()) {
        today = Date().getToday()
        self.service = service
    }
    
    func startEngine(){
        HomeDelegate?.RenderUI()
        HomeDelegate?.HomeStateChange(state: .loading)
        DispatchQueue.main.async {
            self.LoadData { (success) in
                if success {
                    print("✅ HomeViewModel: Data update successfully.")
                    self.HomeDelegate?.HomeStateChange(state: .active)
                }else{
                    print("❌ HomeViewModel: Loading Data failed.")
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
        do{
            let response = try? JSONDecoder().decode(HomeModel.self, from: data)
            return response!
        }catch(let err){ print(err.localizedDescription) }
    }
}
