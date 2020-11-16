//
//  ViewController.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit

class HomeVC: UIViewController {
    
    
    // init lazy viewModel
    lazy var viewModel:HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.title = "Weather Show"
        setupView()
        setupLayout()
        addVCs()
        viewModel.LoadData()
    }
    
    // Mark: -properties
    lazy var userInfoContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var weatherInfoContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // Mark - setup and add views
    private func setupView(){
        self.view.addSubview(userInfoContainer)
        self.view.addSubview(weatherInfoContainer)
    }
    
    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        
        userInfoContainer.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor,right: self.view.rightAnchor,paddingLeft: 0.0, paddingRight: 0.0, height: 82)
        weatherInfoContainer.anchor(top: userInfoContainer.bottomAnchor, left: self.view.leftAnchor,bottom: self.view.bottomAnchor, right: self.view.rightAnchor,paddingLeft: 0.0, paddingBottom: 64.0, paddingRight: 0.0,width: self.view.frame.width,cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        self.view.layoutIfNeeded()
        
        
    }
    private func addVCs(){
        let userInfoVC = UserInfoVC()
        let weatherInfoVC = WeatherInfoVC()
        add(vc: userInfoVC, to: userInfoContainer)
        add(vc: weatherInfoVC, to: weatherInfoContainer)
    }
    
    



}

