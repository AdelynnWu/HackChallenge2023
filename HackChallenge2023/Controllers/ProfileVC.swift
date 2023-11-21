//
//  ProfileVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit
// for profile and starred application

class ProfileVC: UIViewController {
    //MARK: PropertiesView
    private var clubCollectionView: UICollectionView!
    
    // MARK: Properties Data
    var clubs: [Club] = dummyData
    var starredClubs: [String]  {
        UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
    }
    var selected_clubs: [Club] = dummyData
    
    
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.backgroundColor = UIColor.hc.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupClubCollectionView()
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

    
    //MARK: setupViews
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
        clubCollectionView.showsVerticalScrollIndicator = false

        view.addSubview(clubCollectionView)
        
//        refreshControl.addTarget(self, action: #selector(getRecipe), for: .valueChanged)
//        clubCollectionView.refreshControl = refreshControl
        
        // constraints
        clubCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(23)
            make.bottom.equalToSuperview()
        }
    }
}


//MARK: UICollectionViewDelegate
extension ProfileVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectedItem = self.clubs[indexPath.row]
        var favorites = [Club]()

        for club in clubs{
            for names in starredClubs {
                if club.club_name == names{
                    favorites.append(club)
                }
            }
        }
        let selectedItem = favorites[indexPath.row]
//        let ls = clubs.filter ({ $0.club_name in })
//        selected_recipes = ls
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.reuse, for: indexPath) as? ClubCollectionViewCell{
//            let clubs = selected_clubs[indexPath.row]
//            if isStarred == self.starredClubs.contains(clubs.club_name)
        
        let detailedVC = DetailedVC()
        navigationController?.pushViewController(detailedVC, animated: true)
        clubCollectionView.reloadData()
    }
    
}
//MARK: UICollectionViewDataSource
extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        clubCollectionView.reloadData()
        var favorites = [Club]()

        for club in clubs{
            for names in starredClubs {
                if club.club_name == names{
                    favorites.append(club)
                }
            }
        }
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.reuse, for: indexPath) as? ClubCollectionViewCell{
            clubCollectionView.reloadData()
            var favorites = [Club]()

            for club in clubs{
                for names in starredClubs {
                    if club.club_name == names{
                        favorites.append(club)
                    }
                }
            }
            let clubs = favorites[indexPath.row]
            var isStarred = self.starredClubs.contains(clubs.club_name)
            cell.configure(club: clubs, starred: isStarred)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

//MARK: UIDelegateFlowLayout
extension ProfileVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 327, height: 103)
    }
}

