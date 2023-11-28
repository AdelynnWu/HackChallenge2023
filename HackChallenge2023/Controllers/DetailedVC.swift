//
//  DetailedVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

// for detailed page of the application/club

class DetailedVC: UIViewController {
    
    // MARK: - Properties (views)
    
    // MARK: - Properties (data)
    
    // MARK: init and viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.hc.white
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [

                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    //UIColor(red: 174/255, green: 93/255, blue: 246/255, alpha: 1.0).cgColor,
                ]
        view.layer.addSublayer(gradientLayer)
    }
    
    init() {
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup views
    
    
}
