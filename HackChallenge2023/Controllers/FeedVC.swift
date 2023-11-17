//
//  FeedVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit

class FeedVC: UIViewController {
    
    // MARK: Properties View
    private var clubCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: Properties Data
    var clubs: [Club] = dummyData
    var filter: [String] = filters
    
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Organizations"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.white
        
//      fetchData func
// setup collectionView func
        setupFilterCollectionView()
        setupClubCollectionView()
    }
    
    //MARK: Networking
    
    //MARK: SetUpViews
    
    private func setupFilterCollectionView(){
        
        // Create FlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // Initialize CollectionView with the layout
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuse)
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        view.addSubview(filterCollectionView)
        
        // Constraints
        filterCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(25)
        }
        
    }
    
    private func setupClubCollectionView(){
        
        // Create a FlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.collectionView?.alwaysBounceVertical = true
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 14

        // Initialize CollectionView with the layout
        clubCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clubCollectionView.register(ClubCollectionViewCell.self, forCellWithReuseIdentifier: ClubCollectionViewCell.reuse)
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self

        view.addSubview(clubCollectionView)
        
//        refreshControl.addTarget(self, action: #selector(getRecipe), for: .valueChanged)
//        clubCollectionView.refreshControl = refreshControl
        
        // constraints
        clubCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(filterCollectionView.snp.bottom).offset(23)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: UICollectionViewDelegate
//extension FeedVC: UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//    
//}

//MARK: UICollectionViewDataSource
extension FeedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return filter.count
        } else {
            return clubs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView {
            guard let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as? FilterCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            cell.configure(category: filter[indexPath.row])
            return cell
        } else {
            guard let cell = clubCollectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.reuse, for: indexPath) as? ClubCollectionViewCell else{
                return UICollectionViewCell()
            }
        
            cell.configure(club: clubs[indexPath.row])
            return cell
        }
    }
    
}

//MARK: UIDelegateFlowLayout
extension FeedVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == filterCollectionView {
            return CGSize(width: 110, height: 25)
        } else {
            return CGSize(width: 327, height: 103)
        }
    }
}
