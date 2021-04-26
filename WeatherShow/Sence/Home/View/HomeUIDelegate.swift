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
        setupUINavigationBar()
    }
    
    func HomeStateChange(state:HomeState){
        switch state {
        case .active:
            addVCs()
            let countryCode = viewModel.dataModel?.sys.country ?? "Faild"
            let countryName = viewModel.dataModel?.name ?? "Faild"
            let location = "\(countryCode), \(countryName)"
            DispatchQueue.main.async {
                self.userDelegate?.updateLocationTitle(data: location)
                self.weatherDelegate?.bindingData(data: self.viewModel.dataModel!, today: self.viewModel.today)
            }
            dataUpdated()
        case .loading:
            loading()
        }
    }
    
}
