//
//  HistoryVC.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//

import UIKit

protocol HistoryDelegate: class {
    func updatingData() -> ()
    func invalidData() -> ()
    func dataUpdated() -> ()
}

class HistoryVC: UIViewController{
    
    // init lazy viewModel
    lazy var viewModel: HistoryViewModel = {
        let viewModel = HistoryViewModel(view: self)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupExitButton()
        setupCollectionView()
        setupTitleLable()
        viewModel = HistoryViewModel(view: (self))
        viewModel.loadHistory()

        
    }
    
    lazy var activityIndactor:UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.alpha = 0.0
        return ai
    }()
    
    private var exitButton:UIButton = {
        var btn = UIButton()
        btn.setTitle("❌", for: .normal)
        btn.titleLabel?.font = Setting.Display.Font.LargeTitle
        return btn
    }()
    
    private var titleLabel:UILabel = {
        var lbl = UILabel()
        lbl.text = "All Request History"
        lbl.font = Setting.Display.Font.SmallTitle
        return lbl
    }()
    
    let historyCellIdentifier = "historyCellIdentifier"
    var historyCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16.0
        layout.minimumInteritemSpacing = 16.0
        let CollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        CollectionView.translatesAutoresizingMaskIntoConstraints = false
        CollectionView.showsVerticalScrollIndicator = false
        CollectionView.showsHorizontalScrollIndicator = false
        CollectionView.backgroundColor = .white
        return CollectionView
    }()
    
    private func setupCollectionView(){
        
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: historyCellIdentifier)
        self.view.addSubview(historyCollectionView)
        historyCollectionView.anchor(top: exitButton.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor)
        
    }
    
    private func setupExitButton(){
        self.view.addSubview(exitButton)
        exitButton.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, right: self.view.rightAnchor,paddingRight: 32.0)
        exitButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    private func setupTitleLable(){
        self.view.addSubview(titleLabel)
        titleLabel.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, paddingTop: 24.0, paddingLeft: 32.0)
    }
    
    @objc private func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }

}

extension HistoryVC:HistoryDelegate{
    
    func updatingData() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.historyCollectionView.alpha = 0.0
                self.activityIndactor.alpha = 1.0
                self.activityIndactor.startAnimating()
            }
        }
    }
    
    func invalidData() {
        print("invalid Data")
    }
    
    func dataUpdated() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.activityIndactor.stopAnimating()
                self.activityIndactor.alpha = 0.0
                self.historyCollectionView.alpha = 1.0
            }
        }
    }
    
    
}

