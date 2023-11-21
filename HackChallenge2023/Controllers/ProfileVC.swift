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
    override func viewWillAppear(_ animated: Bool) {

            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = true

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
//            appearance.backgroundColor = UIColor.systemPink
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
