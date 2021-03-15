//
//  CardDetailsView.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

class CardDetailsView: UIView {
    
    required init(){
        super.init(frame: CGRect.zero)
        // Can't call super.init() here because it's a convenience initializer not a desginated initializer
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - properties
    private var Title:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.Headline
        title.textAlignment = .left
        return title
    }()
    
    // Mark: - properties
    private var RefrenceValue:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.LargeTitle
        title.textAlignment = .left
        return title
    }()
    
    
    private func setupView(){
        self.addSubview(Title)
        self.addSubview(RefrenceValue)
    }
    
    private func setupLayout(){
        Title.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, right: self.rightAnchor,
                     paddingTop: 32.0,paddingLeft: 16.0)
        RefrenceValue.anchor(top: Title.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor,
                             paddingLeft: 16.0)
    }
    
    
    func ConfigureCard(title:String,refrence:String,color:UIColor){
        Title.text = title
        RefrenceValue.text = refrence
        self.backgroundColor = color
        self.layer.cornerRadius = Setting.Display.cornerRadius.baseCornerRadius
        self.clipsToBounds = true
    }

}
