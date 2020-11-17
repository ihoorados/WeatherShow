//
//  HomeDelegate.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation

protocol HomeDelegate: class {
    func updatingData() -> ()
    func invalidData() -> ()
    func dataUpdated() -> ()
}
