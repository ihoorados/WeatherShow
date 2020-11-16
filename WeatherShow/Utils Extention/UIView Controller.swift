//
//  UIView Controller.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

extension UIViewController{
    
    func add(vc:UIViewController,to view:UIView){
                
        addChild(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        vc.view.center.y += self.view.frame.height
        view.addSubview(vc.view)
        vc.didMove(toParent: self)

        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .beginFromCurrentState) {
                vc.view.center.y -= self.view.frame.height
            } completion: { (true) in
            }
        }
    }
}
