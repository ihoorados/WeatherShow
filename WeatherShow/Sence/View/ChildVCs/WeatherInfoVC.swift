//
//  WeatherInfoVC.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit

class WeatherInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupLayout()
    }
    
    
    private var weatherDetailsView:WeatherDetailsView = {
       let view = WeatherDetailsView()
        return view
    }()
    
    private var WindstatusCard:CardDetailsView = {
       let view = CardDetailsView()
        view.ConfigureCard(title: "Wind status", refrence: "120 km", color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        return view
    }()
    
    private var humidityCard:CardDetailsView = {
       let view = CardDetailsView()
        view.ConfigureCard(title: "Humidity", refrence: "40%", color: #colorLiteral(red: 0.9882352941, green: 0.1764705882, blue: 0.3333333333, alpha: 1))
        return view
    }()
    
    // Mark - setup and add views
    private func setupView(){
        self.view.addSubview(weatherDetailsView)
        self.view.addSubview(WindstatusCard)
        self.view.addSubview(humidityCard)

    }
    
    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        self.view.layer.cornerRadius = Setting.Display.cornerRadius.baseCornerRadius
        self.view.clipsToBounds = true
        
        weatherDetailsView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor,height: 250, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        WindstatusCard.anchor(top: weatherDetailsView.bottomAnchor, left: self.view.leftAnchor, width: CardWith(width: self.view.frame.width), height: 130.0, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        humidityCard.anchor(top: weatherDetailsView.bottomAnchor, left: WindstatusCard.rightAnchor, width: CardWith(width: self.view.frame.width), height: 130.0, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        

    }
    
    func CardWith(width:CGFloat) -> CGFloat {
        let width = width - 48.0
        return width / 2
    }
}
