//
//  TabController.swift
//  HackChallenge2023
//
//  Created by Kathleen Chen on 11/18/23.
//

import UIKit


class TabController: UITabBarController {
    override func viewDidLayoutSubviews() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = 85
        tabFrame.origin.y = view.frame.size.height - 85
        tabBar.frame = tabFrame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        

//        self.tabBar.tintColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
        self.tabBar.tintColor = UIColor.systemPink
        self.tabBar.isTranslucent = false
//        self.tabBar.backgroundColor = UIColor.hc.babyBlue
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.gray
        // Do any additional setup after loading the view.
    }
    
    private func setupTabs(){
        let home = self.createNav(with: "Organizations", and: UIImage(systemName: "person.3.fill"), vc: FeedVC())
        let profile = self.createNav(with: "Saved", and: UIImage(systemName: "star"), vc: ProfileVC())
        let post = self.createNav(with: "Post", and: UIImage(systemName: "square.and.pencil.circle"), vc: PostAppVC())
//        let vc = FeedVC()
//        vc.tabBarItem.image
        self.setViewControllers([home,profile,post], animated: true)
    }
    private func createNav(with title: String, and image:UIImage?,vc: UIViewController )-> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        return nav
    }
}
