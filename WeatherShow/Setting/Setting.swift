//
//  Setting.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

class Setting: NSObject {
    
    struct Display {
        
        struct Font {
            static var XXLargeTitle = UIFont.systemFont(ofSize: 48, weight: .medium)
            static var XLargeTitle = UIFont.systemFont(ofSize: 36, weight: .medium)
            static var LargeTitle = UIFont.systemFont(ofSize: 31, weight: .medium)
            static var MediumTitle = UIFont.systemFont(ofSize: 28, weight: .medium)
            static var SmallTitle = UIFont.systemFont(ofSize: 23, weight: .medium)
            static var Headline = UIFont.systemFont(ofSize: 19, weight: .semibold)
            static var Body = UIFont.systemFont(ofSize: 18, weight: .medium)
            static var Callout = UIFont.systemFont(ofSize: 17, weight: .medium)
            static var SubHead = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        struct Padding {
            static var left : CGFloat = 16.0
            static var top : CGFloat = 16.0
            static var right : CGFloat = 16.0
            static var bottom : CGFloat = 16.0
        }
                
        struct cornerRadius {
            static var tinyCornerRadius : CGFloat = 4
            static var smallCornerRadius : CGFloat = 16.0
            static var baseCornerRadius : CGFloat = 24.0
            static var largCornerRadius : CGFloat = 64.0
        }
        
    }
    
}
