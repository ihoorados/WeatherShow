//
//  WeatherDetailsView.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import Foundation
import UIKit

class WeatherDetailsView: UIView {
    
    required init(){
        super.init(frame: CGRect.zero)
        // Can't call super.init() here because it's a convenience initializer not a desginated initializer
        setupView()
        setupLayout()
        self.backgroundColor = .darkText
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // Mark: - properties
    private var TodaysTitle:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.LargeTitle
        title.text = "Todays highlight"
        title.textAlignment = .left
        return title
    }()

    private var DateTitle:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.SubHead
        title.text = "Monday 30 Feb"
        title.textAlignment = .left
        return title
    }()

    private var WeatherTitle:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.XXLargeTitle
        title.text = "8 c"
        title.textAlignment = .left
        return title
    }()
    private var WeatherDescription:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.SubHead
        title.text = "Light showers, Mostly Cloudy"
        title.textAlignment = .left
        return title
    }()

    // Mark - setup and add views
    private func setupView(){
        self.addSubview(TodaysTitle)
        self.addSubview(DateTitle)
        self.addSubview(WeatherTitle)
        self.addSubview(WeatherDescription)
    }

    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        self.layer.cornerRadius = Setting.Display.cornerRadius.baseCornerRadius
        self.clipsToBounds = true
        TodaysTitle.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor,paddingTop: 32.0,paddingLeft: 32.0)
        DateTitle.anchor(top: TodaysTitle.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor,paddingLeft: 32.0)
        WeatherTitle.anchor(top: DateTitle.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor,paddingLeft: 32.0)
        WeatherDescription.anchor(top: WeatherTitle.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor,paddingLeft: 32.0)
    }


}



