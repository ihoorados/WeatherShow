//
//  ViewController.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit
import Foundation

class HomeVC: UIViewController {
    
    
    // MARK: Properties and Delegate
    var viewModel: HomeViewModel
    var userDelegate:UserInfoDelegate?
    var weatherDelegate:WeatherInfoDelegate?
    
    // MARK: Dependecny
    init(viewModel:HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.HomeDelegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: app life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("📲 --------- HomeVC view did load ---------")
        self.view.backgroundColor = .systemBackground
        self.title = "Weather Show"
        viewModel.startEngine()
    }
    
    
    // MARK: UI Properties
    /*
     userInfoContainer
     weatherInfoContainer
     activityIndactor
    */
    lazy var userInfoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemBackground
        return view
    }()
    
    lazy var weatherInfoContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var activityIndactor:UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .darkText
        return ai
    }()
    
    
    // MARK:  Methods
    /*
     setupUIView
     setupUILayout
     updateViewItems
     addVCs
    */
    
    func setupUIView(){
        self.view.addSubview(userInfoContainer)
        self.view.addSubview(weatherInfoContainer)
        self.view.addSubview(activityIndactor)
        print("✅ HomeVC : setup UIViews Completed.")
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    @objc func addTapped(_ Sender:UIButton){
        print("add Tapped")
    }
    
    func setupUILayout(){
        userInfoContainer.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                                 left: self.view.leftAnchor,
                                 right: self.view.rightAnchor,
                                 paddingLeft: 0.0,
                                 paddingRight: 0.0,
                                 height: view.frame.height/8)
        
        weatherInfoContainer.anchor(top: userInfoContainer.bottomAnchor,
                                    left: self.view.leftAnchor,
                                    bottom: self.view.bottomAnchor,
                                    right: self.view.rightAnchor,
                                    paddingLeft: 0.0, paddingBottom: 64.0, paddingRight: 0.0,
                                    width: self.view.frame.width,
                                    cornerRadius: Setting.Display.cornerRadius.baseCornerRadius)
        
        activityIndactor.center = self.view.center
        self.view.layoutIfNeeded()
        print("✅ HomeVC : setup UILayouts completed.")
    }
    
    func updateViewItems(){
        addVCs()
        weatherDelegate?.bindingData(data: self.viewModel.dataModel!, today: viewModel.today)
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
    
    func loading() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.startAnimating()
            }
        }
    }
    
    func dataUpdated() {
        DispatchQueue.main.async {
            self.updateViewItems()
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.stopAnimating()
                self.activityIndactor.alpha = 0.0
            }
        }
    }
}
