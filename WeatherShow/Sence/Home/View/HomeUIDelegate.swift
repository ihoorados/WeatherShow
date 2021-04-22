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
    func loading()
    func dataUpdated()
    func invalidData()
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
    
    func invalidData() {
        // Restart engine
        viewModel.startEngine()
    }
    
    func loading() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.startAnimating()
            }
        }
    }
    
    func dataUpdated() {
        DispatchQueue.main.async {
            self.updateViewItems()
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.stopAnimating()
                self.activityIndactor.alpha = 0.0
            }
        }
    }
    
    
}
