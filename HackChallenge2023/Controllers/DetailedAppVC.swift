//
//  DetailedAppVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit

class FeedVC: UIViewController{
    // MARK: Properties View
    private var clubCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: Properties Data
    var clubs: [Club] = dummyData
    var filters = ["Project Team","STEM", "Business","GreekLife", "Arts", "Music", "Cultural","Environmental", "Community", "Other"]
    
    //MARK: ViewdidLoad
    
    
    //MARK: SetUpViews
}

//MARK: UICollectionViewDelegate

//MARK: UICollectionViewDataSource

//MARK: UIDelegateFlowLayout
