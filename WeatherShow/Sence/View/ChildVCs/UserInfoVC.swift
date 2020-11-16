//
//  UserInfoVC.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit

class UserInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupLayout()
    }
    
    
    // Mark: - properties
    private var locationImageView:UIImageView = {
        let locationIcon = UIImageView()
        locationIcon.image = UIImage(named: "Location-icon")
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.clipsToBounds = true
        return locationIcon
    }()
    
    private var locationTitle:UILabel = {
       let title = UILabel()
        title.textColor = .darkText
        title.font = Setting.Display.Font.Headline
        title.text = "Iran, Tehran"
        title.textAlignment = .left
        return title
    }()
    
    private var userProfileImageView:UIImageView = {
        let userProfileImage = UIImageView()
        userProfileImage.image = UIImage(named: "User-profile")
        userProfileImage.contentMode = .scaleAspectFit
        userProfileImage.clipsToBounds = true
        return userProfileImage
    }()
    
    
    // Mark - setup and add views
    private func setupView(){
        self.view.addSubview(locationImageView)
        self.view.addSubview(locationTitle)
        self.view.addSubview(userProfileImageView)
    }
    
    // Mark - configure views and apply autoLayout
    private func setupLayout(){
        locationImageView.anchor(top: self.view.topAnchor,left: self.view.leftAnchor, width: 35.0, height: 35.0)
        locationTitle.anchor(top: self.view.topAnchor,left: locationImageView.rightAnchor,right: self.view.safeAreaLayoutGuide.rightAnchor)
        userProfileImageView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.rightAnchor,width: 60, height: 60)
    }
    

}
