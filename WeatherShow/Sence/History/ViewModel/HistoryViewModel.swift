//
//  HistoryViewModel.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//

import Foundation


class HistoryViewModel{
    
    var historys = [History]()
    weak var HistoryVC : HistoryDelegate?
    // Mark: - Properties
    var dataManagement: DataManagement = DataManagement()
    
    init(view:HistoryDelegate) {
        self.HistoryVC = view
    }
    
    func loadHistory(){
        guard let historys = dataManagement.fetchAndPrintEachPerson() else {
            return
        }
        self.historys = historys
        print(self.historys)
    }
    
}
