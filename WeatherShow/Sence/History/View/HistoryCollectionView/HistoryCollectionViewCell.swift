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
        label.font = Setting.Display.Font.SubHead
        label.textColor = #colorLiteral(red: 0.2823529412, green: 0.8352941176, blue: 0.3882352941, alpha: 1)
        return label
    }()
    var tempLabel:UILabel = {
        let label = UILabel()
        label.font = Setting.Display.Font.SmallTitle
        label.textColor = .white
        return label
    }()
    var dateLable:UILabel = {
        let label = UILabel()
        label.font = Setting.Display.Font.SmallTitle
        label.textColor = .white
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
        tempLabel.text = "\(ConvertToC(value: object.temp)) ℃"
        LocationLabel.text = object.location
    }
    
    private func setupLayout(){
        dateLable.anchor(top: self.topAnchor, left: self.leftAnchor,paddingLeft: 32.0)
        tempLabel.anchor(top: dateLable.bottomAnchor, left: self.leftAnchor,paddingLeft: 32.0)
        LocationLabel.anchor(top: tempLabel.bottomAnchor, left: self.leftAnchor,paddingTop: 8.0,paddingLeft: 32.0)
    }
    
    private func setUpView(){
        self.addSubview(dateLable)
        self.addSubview(tempLabel)
        self.addSubview(LocationLabel)
        self.layer.cornerRadius = Setting.Display.cornerRadius.baseCornerRadius
        self.clipsToBounds = true
        self.backgroundColor = .darkText
        
    }
    
    // these guys shouldn't be here
    private func ConvertToC(value:Double) -> Int {
        return Int(value - 273.15)
    }

}
