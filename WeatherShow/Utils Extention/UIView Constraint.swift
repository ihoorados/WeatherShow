//
//  UIView.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

extension UIView {
    
    func anchor(top:NSLayoutYAxisAnchor? = nil,
                left:NSLayoutXAxisAnchor? = nil,
                bottom:NSLayoutYAxisAnchor? = nil,
                right:NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = Setting.Display.Padding.top,
                paddingLeft: CGFloat = Setting.Display.Padding.left,
                paddingBottom: CGFloat = Setting.Display.Padding.bottom,
                paddingRight: CGFloat = Setting.Display.Padding.right,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                cornerRadius: CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    func centerX(inView view : UIView){
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerY(inView view : UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
