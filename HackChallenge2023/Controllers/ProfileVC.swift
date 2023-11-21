//
//  ProfileVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
// for profile and starred application

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.backgroundColor = UIColor.hc.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
