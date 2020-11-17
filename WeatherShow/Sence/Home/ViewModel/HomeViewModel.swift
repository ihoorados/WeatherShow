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
    weak var Home:HomeDelegate?
    var today: String?
    
    init(view:HomeDelegate) {
        self.Home = view
        self.today = Date().getToday()
    }
    
    func startEngine(){
        Home?.updatingData()
        DispatchQueue.main.async {
            self.LoadData { (success) in
                if success {
                    self.Home?.dataUpdated()
                }else{
                    self.Home?.invalidData()
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
        let response = try! JSONDecoder().decode(HomeModel.self, from: data)
        return response
    }
}
