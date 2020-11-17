//
//  WeatherInfoVC.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit
import Foundation

protocol WeatherInfoDelegate: class {
    func bindingData(data:HomeModel,today:String) -> ()
}

class WeatherInfoVC: UIViewController, WeatherInfoDelegate {
    
    // Mark: - User Protocols for notify binding data to view
    func bindingData(data:HomeModel,today:String) {
        //Update Data
        weatherDetailsView.updateData(data: data,today:today)
        WindstatusCard.ConfigureCard(title: "Wind status", refrence: "\(data.wind.speed) m/s", color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        humidityCard.ConfigureCard(title: "Humidity", refrence: "\(data.main.humidity)%", color: #colorLiteral(red: 0.9882352941, green: 0.1764705882, blue: 0.3333333333, alpha: 1))
    }

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
        return view
    }()
    
    private var humidityCard:CardDetailsView = {
       let view = CardDetailsView()
        return view
    }()
    
    private var historyButton:UIButton = {
        var btn = UIButton()
        btn.setTitle("All history", for: .normal)
        btn.titleLabel?.font = Setting.Display.Font.SubHead
        btn.setTitleColor(.darkText, for: .normal)
        btn.layer.borderColor = UIColor.darkText.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    // Mark - setup and add views
    private func setupView(){
        self.view.addSubview(weatherDetailsView)
        self.view.addSubview(WindstatusCard)
        self.view.addSubview(humidityCard)
        self.view.addSubview(historyButton)
        historyButton.addTarget(self, action: #selector(NavigateToHistory), for: .touchUpInside)
    }
    
    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        self.view.layer.cornerRadius = Setting.Display.cornerRadius.baseCornerRadius
        self.view.clipsToBounds = true
        weatherDetailsView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor,height: 252, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        WindstatusCard.anchor(top: weatherDetailsView.bottomAnchor, left: self.view.leftAnchor, width: CardWith(width: self.view.frame.width), height: 132.0, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        humidityCard.anchor(top: weatherDetailsView.bottomAnchor, left: WindstatusCard.rightAnchor, width: CardWith(width: self.view.frame.width), height: 132.0, cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        historyButton.anchor(left: self.view.leftAnchor, bottom:self.view.bottomAnchor,right: self.view.rightAnchor, height: 60, cornerRadius: 16.0)
        historyButton.centerX(inView: self.view)
    }
    
    // bad position function
    func CardWith(width:CGFloat) -> CGFloat {
        let width = width - 48.0
        return width / 2
    }
    
    @objc func NavigateToHistory(){
        print("navigate  to history")
        self.present(HistoryVC(), animated: true, completion: nil)
    }
}
