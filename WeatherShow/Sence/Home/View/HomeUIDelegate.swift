//
//  HomeUIDelegate.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 3/15/21.
//

import Foundation
import UIKit


enum HomeState {
    case loading
    case active
    
}

// Mark: - Home Data Model Delegate
protocol HomeDelegate: class {
    func RenderUI()
    func HomeStateChange(state: HomeState)
}


extension HomeVC : HomeDelegate {
    
    // MARK: Render Home User Interface
    func RenderUI(){
        setupUIView()
        setupUILayout()
    }
    
    func HomeStateChange(state:HomeState){
        switch state {
        case .active:
            dataUpdated()
        case .loading:
            loading()
        }
    }
    
}
