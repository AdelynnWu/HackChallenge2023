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
    private let refreshControl = UIRefreshControl()

    // MARK: Properties Data
    var clubs: [Club] = []
    var starredClubs: [String] = []
    var selected_clubs: [Club] = []
    var favorites = [Club]()
    
    
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Saved"
        self.view.backgroundColor = UIColor.hc.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            
            UIColor.hc.gradientPink1.cgColor,
            UIColor.hc.gradientPink2.cgColor,
            UIColor.hc.gradientPink3.cgColor,
            UIColor.hc.gradientPink4.cgColor
        ]
        view.layer.addSublayer(gradientLayer)
        getClubs()
        updateFavorites()
        setupClubCollectionView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        updateFavorites()
        clubCollectionView.reloadData()
    }
    
    func updateFavorites() {
        starredClubs = UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
        favorites = []
        for club in clubs {
            for names in starredClubs {
                if club.club_name == names{
                    favorites.append(club)
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {

            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = true

            let appearance = UINavigationBarAppearance()
//            appearance.backgroundColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
        appearance.backgroundColor = UIColor.hc.gradientPink1
//            appearance.backgroundColor = UIColor.systemPink
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
            

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            
        
    }
    
//    private func setUpNavigationBar() {
////        contentView.addSubview(UIImage.init(systemName: "bookmark"))
//        // Check UserDefaults
//        let starred = UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
//
//        var imageName = ""
//        for club in clubs {
//            if starred.contains(club.club_name){
//                imageName = "star.fill"
//
//            }
//            else {
//                starred.append(club.club_name)
//            }
//
//        }
//        if starred.contains(recipe.id) {
//        // Is stored in favorites
//            imageName = "bookmark.fill"
//            bookmarkIcon.image = UIImage(systemName: "bookmark.fill")
//        } else {
//        // Not stored in favorites
//            imageName = "bookmark"
//            bookmarkIcon.image = UIImage(systemName: "bookmark")
//        }
//
//        let barbutton = UIBarButtonItem(image: UIImage(systemName: imageName), style: .plain, target: self, action: #selector(toggleSave))
//        navigationItem.rightBarButtonItem = barbutton
//    }

//    @objc private func toggleSave() {
//
//        var starred = UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
//        for club in clubs{
//            if starred.contains(club.club_name){
//                starred.removeAll{ name in
//                    name == club.club_name}
//            }
//            else {
//                starred.append(club.club_name)
//            }
//        }
//
//
//
//        UserDefaults.standard.setValue(starred, forKey: "starred")
//
//
//        //setUpNavigationBar()
//        
//
//
//    }
    //MARK: setupViews
    private func setupClubCollectionView(){
        
        // Create a FlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 14

        // Initialize CollectionView with the layout
        clubCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clubCollectionView.register(ClubCollectionViewCell.self, forCellWithReuseIdentifier: ClubCollectionViewCell.reuse)
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self
        clubCollectionView.alwaysBounceVertical = true
        clubCollectionView.showsVerticalScrollIndicator = false
        clubCollectionView.backgroundColor = UIColor.clear

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
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//       //Check the scroll direction here
//        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
//            print("Show")
//            self.navigationController?.setNavigationBarHidden(false, animated: true)
//            self.navigationController?.setToolbarHidden(false, animated: true)
//        }
//        else {
////            print("Hide")
////            self.navigationController?.setNavigationBarHidden(true, animated: true)
////            self.navigationController?.setToolbarHidden(true, animated: true)
//        }
//    }
    // MARK: Networking

    @objc private func getClubs() {
        NetworkManager.shared.fetchClubs { [weak self] clubs in
            guard let self = self else { return }
            self.clubs = clubs.applications
            self.selected_clubs = clubs.applications
            
            DispatchQueue.main.async {
                self.clubCollectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
            
        } // the thing in the brackets is a function we pass it into completion, it retrieves as posts
    }
}


//MARK: UICollectionViewDelegate
extension ProfileVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

//        var favorites = [Club]()
//
//        for club in clubs{
//            for names in starredClubs {
//                if club.club_name == names{
//                    favorites.append(club)
//                }
//            }
//        }
        let selectedItem = favorites[indexPath.row]
        let detailedVC = DetailedVC(club_name: selectedItem.club_name,description:selectedItem.description, month: selectedItem.month, day: selectedItem.day, year: selectedItem.year, app_link: selectedItem.app_link, club_link: selectedItem.club_link, club: selectedItem)
        navigationController?.pushViewController(detailedVC, animated: true)
//        clubCollectionView.reloadData()
    }
    
}
//MARK: UICollectionViewDataSource
extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        clubCollectionView.reloadData()
//        var favorites = [Club]()
//
//        for club in clubs{
//            for names in starredClubs {
//                if club.club_name == names{
//                    favorites.append(club)
//                }
//            }
//        }
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.reuse, for: indexPath) as? ClubCollectionViewCell{
//            clubCollectionView.reloadData()
//            var favorites = [Club]()
//
//            for club in clubs{
//                for names in starredClubs {
//                    if club.club_name == names{
//                        favorites.append(club)
//                    }
//                }
//            }
            let clubs = favorites[indexPath.row]
            let isStarred = self.starredClubs.contains(clubs.club_name)
            cell.configure(club: clubs, starred: isStarred)
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
}

//MARK: UIDelegateFlowLayout
extension ProfileVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.backgroundColor = UIColor.clear
        return CGSize(width: 327, height: 110)
    }
}
//MARK: delegate for star butgton
extension ProfileVC: starredClubsDelegate{
    func updateStarred(clubName: String) {
            if self.starredClubs.contains(clubName){
                var newStarredClubs = self.starredClubs
                newStarredClubs.removeAll() { name in
                    return name == clubName
                }
                UserDefaults.standard.setValue(newStarredClubs, forKey: "starred")
            }
            updateFavorites()
            clubCollectionView.reloadData()
        }
    
    
    }




