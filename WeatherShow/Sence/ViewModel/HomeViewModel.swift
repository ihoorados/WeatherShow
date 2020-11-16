//
//  HomeViewModel.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation


struct HomeViewModel{
    
    // Mark: - Properties
    var service : ServiceController = ServiceController()
    
    func LoadData(){
        service.RequestWeather { (data, err) in
            if let Data = data {
                nsdataToJSON(data: Data)
            }else{
                print(err.debugDescription)
            }
        }
    }
    
    
    // Convert from NSData to json object
    func nsdataToJSON(data: Data){
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(jsonResponse as! NSDictionary)
        }
        catch let error
        {
            print(error)
        }
    }
    
    
}
