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
    var service : ServiceController = ServiceController()
    var dataManagement: DataManagement = DataManagement()
    
    var dataModel : HomeModel?
    
    
    weak var HomeDelegate:HomeDelegate?
    var today: String?
    
    init(view:HomeDelegate) {
        HomeDelegate = view
        today = Date().getToday()
    }
    
    func startEngine(){
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
        service.RequestWeather { (data, err) in
            if let Data = data {
                self.service.ServiceShared.tools.JSONSerializationWith(Data) { [self] (json, err) in
                    self.dataModel = self.DecodeAndUpdateData(data: Data)
                    dataManagement.saveName(data: self.dataModel!, date: today!)
                    completion(true)
                }
            }else{
                print(err.debugDescription)
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
