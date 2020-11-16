//
//  Setting.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

class Setting: NSObject {
    
    
    struct Device {
        enum UIUserInterfaceIdiom : Int {
            case unspecified
            case phone // iPhone and iPod touch style UI
            case pad   // iPad style UI (also includes macOS Catalyst)
        }
    }
    
    struct URL {
        static var Baseurl = ""
    }
    
    struct Error {
        static var Server = "Server Error"
    }
    
    struct Display {
        
        struct colors {
            struct main {
                static var primaryColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
                static var secondaryColor = #colorLiteral(red: 0.231372549, green: 0.7176470588, blue: 0.631372549, alpha: 1)
                static var tertiaryColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
                
                static var Dashboard = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
                static var TopView = #colorLiteral(red: 0.231372549, green: 0.7176470588, blue: 0.631372549, alpha: 1)
            }
            struct text {
                static var titleColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
                static var subTitleColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
            }
            struct button {
                static var BorderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
                static var PrimaryColor = #colorLiteral(red: 0.231372549, green: 0.7176470588, blue: 0.631372549, alpha: 1)
            }
        }
        
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
