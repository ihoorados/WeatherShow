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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.title = "Weather Show"
        setupView()
        setupLayout()
        viewModel = HomeViewModel(view: (self))
        viewModel.startEngine()
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
    
    lazy var activityIndactor:UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        return ai
    }()
    
    // Mark - setup and add views
    private func setupView(){
        self.view.addSubview(userInfoContainer)
        self.view.addSubview(weatherInfoContainer)
        self.view.addSubview(activityIndactor)
    }
    
    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        userInfoContainer.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor,right: self.view.rightAnchor,paddingLeft: 0.0, paddingRight: 0.0, height: 82)
        weatherInfoContainer.anchor(top: userInfoContainer.bottomAnchor, left: self.view.leftAnchor,bottom: self.view.bottomAnchor, right: self.view.rightAnchor,paddingLeft: 0.0, paddingBottom: 64.0, paddingRight: 0.0,width: self.view.frame.width,cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        activityIndactor.center = self.view.center
        self.view.layoutIfNeeded()
    }
    
    private func addVCs(){
        let userInfoVC = UserInfoVC()
        self.userDelegate = userInfoVC.self
        
        let weatherInfoVC = WeatherInfoVC()
        self.weatherDelegate = weatherInfoVC.self
        
        add(vc: userInfoVC, to: userInfoContainer)
        add(vc: weatherInfoVC, to: weatherInfoContainer)
    }
    
    func updateViewItems(){
        addVCs()
        self.userDelegate?.bindingData(data: self.viewModel.dataModel!)
        self.weatherDelegate?.bindingData(data: self.viewModel.dataModel!, today: viewModel.today!)
    }
}

// Mark: - Home Data Model Delegate

protocol HomeDelegate: class {
    func updatingData() -> ()
    func invalidData() -> ()
    func dataUpdated() -> ()
}

extension HomeVC : HomeDelegate {
    
    func invalidData() {
        // Restart engine
        viewModel.startEngine()
    }
    
    func updatingData() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.userInfoContainer.center.y += self.view.frame.height
                self.weatherInfoContainer.center.y += self.view.frame.height
                self.activityIndactor.startAnimating()
            }
        }
    }
    
    func dataUpdated() {
        DispatchQueue.main.async {
            self.updateViewItems()
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.stopAnimating()
                self.userInfoContainer.center.y -= self.view.frame.height
                self.weatherInfoContainer.center.y -= self.view.frame.height
                self.activityIndactor.alpha = 0.0
            }
        }
    }
    
    
}
