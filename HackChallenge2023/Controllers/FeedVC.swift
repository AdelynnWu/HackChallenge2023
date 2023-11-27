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
    private let titles = UILabel()
    private var clubCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: Properties Data
    var clubs: [Club] = dummyData
    var selected_clubs: [Club] = dummyData
    var filter: [String] = filters
    var starredClubs: [String]  {
        UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
    }
    private var filterSelected: String = ""
    
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnSwipe = true

        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Organizations"
        self.navigationController?.navigationBar.prefersLargeTitles = false

//        self.navigationItem.largeTitleDisplayMode = .never
//        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "American Typewriter Bold", size: 40)!]
//        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
//        view.backgroundColor = UIColor(red: 31/255, green: 86/255, blue: 171/255, alpha: 1.0)
//        view.backgroundColor = UIColor(red: 222/255, green: 246/255, blue: 239/255, alpha: 1.0)
        
//      fetchData func
// setup collectionView func
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            
            UIColor(red: 6/255, green: 137/255, blue: 152/255, alpha: 1.0).cgColor,
            UIColor(red: 155/255, green: 255/255, blue: 215/255, alpha: 1.0).cgColor,
            //UIColor(red: 174/255, green: 93/255, blue: 246/255, alpha: 1.0).cgColor,
        ]
        view.layer.addSublayer(gradientLayer)

        setupFilterCollectionView()
        setupClubCollectionView()
        
    }
    override func viewWillAppear(_ animated: Bool) {

            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = false

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
 //       appearance.backgroundColor = UIColor.hc.babyBlue
//            appearance.backgroundColor = UIColor.systemPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance

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
        filterCollectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(filterCollectionView)
        
        // Constraints
        filterCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(7)
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
        clubCollectionView.showsVerticalScrollIndicator = false

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
extension FeedVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == clubCollectionView {
            let selectedItem = self.clubs[indexPath.row]
            let detailedVC = DetailedVC()
            navigationController?.pushViewController(detailedVC, animated: true)
            
        } else if collectionView == filterCollectionView {
            let selectedFilter = self.filter[indexPath.row]
            filterSelected = selectedFilter
            selected_clubs = clubs
            if selectedFilter == "All"{
                selected_clubs = clubs
            } else {
                let ls = clubs.filter ({ $0.category_id == selectedFilter})
                selected_clubs = ls
            }
            clubCollectionView.reloadData()
            filterCollectionView.reloadData()
        }
    }
    
}

//MARK: UICollectionViewDataSource
extension FeedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return filter.count
        } else {
            return selected_clubs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView {
            if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as? FilterCollectionViewCell {
                let filter = filter[indexPath.row]
                cell.configure(category: filter, filterSelected: filterSelected)
                return cell
            }
        }
        else if collectionView == clubCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.reuse, for: indexPath) as? ClubCollectionViewCell{
                let clubs = selected_clubs[indexPath.row]
                var isStarred = self.starredClubs.contains(clubs.club_name)
                cell.delegate = self
                cell.configure(club: clubs, starred: isStarred)
                return cell
            }
        }

        return UICollectionViewCell()
    }
    
}

//MARK: UIDelegateFlowLayout
extension FeedVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == filterCollectionView {
            // changes collectionview background color
            collectionView.backgroundColor = UIColor.clear
            return CGSize(width: 110, height: 23)
            
        } else {
            collectionView.backgroundColor = UIColor.clear
            return CGSize(width: 327, height: 110)
        }
    }
}


extension FeedVC: starredClubsDelegate{
    func updateStarred(clubName: String) {
            if self.starredClubs.contains(clubName){
                var newStarredClubs = self.starredClubs
                newStarredClubs.removeAll() { name in
                    return name == clubName
                }
                UserDefaults.standard.setValue(newStarredClubs, forKey: "starred")
            } else {
                var newStarredClubs = self.starredClubs
                newStarredClubs.append(clubName)
                UserDefaults.standard.setValue(newStarredClubs, forKey: "starred")
            }
            clubCollectionView.reloadData()
        }
    
    
    }

// delegation
protocol starredClubsDelegate: AnyObject {
    func updateStarred(clubName: String)
}


