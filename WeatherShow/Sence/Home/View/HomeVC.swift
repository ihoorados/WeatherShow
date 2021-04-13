//
//  ViewController.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit
import Foundation

class HomeVC: UIViewController {
    
    // init lazy viewModel
    lazy var viewModel:HomeViewModel = {
        let viewModel = HomeViewModel(view: self)
        return viewModel
    }()
    
    var userDelegate:UserInfoDelegate?
    var weatherDelegate:WeatherInfoDelegate?

    // MARK: app life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        self.title = "Weather Show"
        setupUIView()
        setupUILayout()
        viewModel.startEngine()
    }
    
    // MARK: properties
    lazy var userInfoContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var weatherInfoContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var activityIndactor:UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        return ai
    }()
    
    // MARK - Methods
    private func setupUIView(){
        self.view.addSubview(userInfoContainer)
        self.view.addSubview(weatherInfoContainer)
        self.view.addSubview(activityIndactor)
    }
    
    private func setupUILayout(){
        
        userInfoContainer.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor,right: self.view.rightAnchor,paddingLeft: 0.0, paddingRight: 0.0, height: view.frame.height/8)
        weatherInfoContainer.anchor(top: userInfoContainer.bottomAnchor, left: self.view.leftAnchor,bottom: self.view.bottomAnchor, right: self.view.rightAnchor,paddingLeft: 0.0, paddingBottom: 64.0, paddingRight: 0.0,width: self.view.frame.width,cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        activityIndactor.center = self.view.center
        self.view.layoutIfNeeded()
    }
    
    func updateViewItems(){
        addVCs()
        weatherDelegate?.bindingData(data: self.viewModel.dataModel!, today: viewModel.today!)
    }
    
    private func addVCs(){
        
        let location = String("\(viewModel.dataModel?.sys.country),\(viewModel.dataModel?.name)")
        let userInfoVC = UserInfoVC(location: location)
        self.userDelegate = userInfoVC.self
        
        let weatherInfoVC = WeatherInfoVC()
        self.weatherDelegate = weatherInfoVC.self
        
        add(vc: userInfoVC, to: userInfoContainer)
        add(vc: weatherInfoVC, to: weatherInfoContainer)
    }
}
