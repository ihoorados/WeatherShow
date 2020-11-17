//
//  Date Extention.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//

import Foundation

extension Date {
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var dayOfWeek : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    func getToday() -> String {
        return "\(dayOfWeek) 30 \(month)"
    }
}
