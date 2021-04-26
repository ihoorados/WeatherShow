//
//  Appcoordinator.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 4/14/21.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    func start() {
        let viewController = HomeVC()
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        
        
        window.makeKeyAndVisible()
    }
    
    private func onComplete() {
        // TODO: Complete/Initiate Process here
    }
}
