//
//  UserInfoVC.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit


protocol UserInfoDelegate: class {
    func updateLocationTitle(data:String)
}



class UserInfoVC: UIViewController,UserInfoDelegate {
    
    // Mark: - User Protocols for notify binding data to view
    func updateLocationTitle(data:String) {
        print("UserInfoVC : Location Updated at \(data)")
        locationTitle.text = data
    }
    
    private var Location: String
    init(location:String) {
        Location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Mark: - app life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupLayout()
    }
    
    // Mark: - properties
    private var locationImageView:UIImageView = {
        let locationIcon = UIImageView()
        locationIcon.image = UIImage(systemName: "location.fill.viewfinder")
        locationIcon.tintColor = .label
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.clipsToBounds = true
        locationIcon.backgroundColor = .clear
        return locationIcon
    }()
    
    private var locationTitle:UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = Setting.Display.Font.Headline
        title.textAlignment = .left
        return title
    }()
    
    private var userProfileImageView:UIImageView = {
        let userProfileImage = UIImageView()
        userProfileImage.image = UIImage(systemName: "person.circle.fill")
        userProfileImage.contentMode = .scaleAspectFit
        userProfileImage.clipsToBounds = true
        userProfileImage.tintColor = .label
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
        locationImageView.anchor(top: self.view.topAnchor,
                                 left: self.view.leftAnchor,
                                 width: 40, height: 40)
        locationTitle.anchor(top: self.view.topAnchor,
                             left: locationImageView.rightAnchor,
                             right: userProfileImageView.safeAreaLayoutGuide.leftAnchor,
                             paddingTop: 24.0)
        userProfileImageView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                                    right: self.view.rightAnchor,
                                    width: 40, height: 40)
    }
    
    private func setupDataSource(){
        locationTitle.text = Location
    }

}
