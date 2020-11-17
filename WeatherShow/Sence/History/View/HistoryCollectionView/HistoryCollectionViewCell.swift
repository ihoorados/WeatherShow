//
//  HistoryCollectionViewCell.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//


import UIKit
import Foundation

class HistoryCollectionViewCell: UICollectionViewCell{

    
    var LocationLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 70.0, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2823529412, green: 0.8352941176, blue: 0.3882352941, alpha: 1)
        return label
    }()
    var tempLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .medium)
        label.textColor = #colorLiteral(red: 0.137254902, green: 0.1529411765, blue: 0.1803921569, alpha: 1)
        return label
    }()
    var dateLable:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setupLayout()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataSource(object:History){
        dateLable.text = object.date
        tempLabel.text = "\(object.temp) kelvin"
        LocationLabel.text = "\(object.id)"
    }
    
    private func setupLayout(){
        dateLable.anchor(top: self.topAnchor, left: self.leftAnchor)
        tempLabel.anchor(top: self.topAnchor, left: dateLable.rightAnchor)
        LocationLabel.anchor(top: self.topAnchor, right: self.rightAnchor)
    }
    
    private func setUpView(){
        self.addSubview(dateLable)
        self.addSubview(tempLabel)
        self.addSubview(LocationLabel)
        
    }
    

}
