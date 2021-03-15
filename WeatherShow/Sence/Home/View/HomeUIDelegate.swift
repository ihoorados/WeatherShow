//
//  HomeUIDelegate.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 3/15/21.
//

import Foundation
import UIKit

// Mark: - Home Data Model Delegate
protocol HomeDelegate: class {
    func updatingData()
    func invalidData()
    func dataUpdated()
}

extension HomeVC : HomeDelegate {
    
    func invalidData() {
        // Restart engine
        viewModel.startEngine()
    }
    
    func updatingData() {
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
