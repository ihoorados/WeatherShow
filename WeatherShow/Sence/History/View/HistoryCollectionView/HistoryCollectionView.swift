//
//  HistoryCollectionView.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//


import Foundation
import UIKit

extension HistoryVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.historys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: historyCellIdentifier, for: indexPath) as! HistoryCollectionViewCell
        cell.setupDataSource(object: self.viewModel.historys[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
        }
    }
    
}

extension HistoryVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.historyCollectionView.frame.width - 16), height: 80)
    }
    
}
