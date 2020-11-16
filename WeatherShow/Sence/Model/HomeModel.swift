//
//  HomeModel.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation


struct HomeModel : HomeModelPresentable{
    var name:           String
    var id:             Int
}

protocol HomeModelPresentable {
    var name:            String  {get}
    var id:              Int     {get}
}
