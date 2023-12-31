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
    private var searchController = UISearchController(searchResultsController: nil)
    
    private lazy var searchTextField: UITextField? = { [unowned self] in
            var textField: UITextField?
            self.searchController.searchBar.subviews.forEach({ view in
                view.subviews.forEach({ view in
                    if let view  = view as? UITextField {
                        textField = view
                    }
                })
            })
            return textField
    }()
   
    
    
    // MARK: Properties Data
    var clubs: [Club] = []
    var selected_clubs: [Club] = []
    var filter: [String] = filters
  //  var filter: [Category] = []
    var starredClubs: [String]  {
        UserDefaults.standard.array(forKey: "starred") as? [String] ?? []
    }
    private var filterSelected: String = ""
    
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnSwipe = true
        searchController.obscuresBackgroundDuringPresentation = false
                searchController.searchBar.placeholder = "Search"
                navigationItem.searchController = searchController
                definesPresentationContext = true

        let image = UIImage(named: "navigationbar")
        let imageView = UIImageView(image: image)
        let bannerWidth = navigationController?.navigationBar.frame.size.width
        let bannerHeight = navigationController?.navigationBar.frame.size.height
        let bannerX = (bannerWidth ?? 0) / 2 - (image?.size.width)! / 2
        let bannerY = (bannerHeight ?? 0) / 2 - (image?.size.height)! / 2
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth ?? 0, height: bannerHeight!)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
//        navigationItem.titleView = UIImageView(image: image)

        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationItem.searchController = searchController
//        self.navigationItem.title = "AppHub"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        

//        self.navigationItem.largeTitleDisplayMode = .never
//        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "American Typewriter Bold", size: 40)!]
//        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.hc.lightNavy
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [

//            UIColor.hc.orangePink.cgColor,
//            UIColor.hc.pink.cgColor,
//            UIColor.hc.pastelPink.cgColor
            UIColor.hc.gradientPink1.cgColor,
            UIColor.hc.gradientPink2.cgColor,
            UIColor.hc.gradientPink3.cgColor,
            UIColor.hc.gradientPink4.cgColor

        ]
//        view.layer.addSublayer(gradientLayer)
  //      getFilters()
        getClubs()
        setupFilterCollectionView()
        setupClubCollectionView()
        searchController.searchResultsUpdater = self
        
        self.navigationItem.hidesSearchBarWhenScrolling = true
       // self.navigationItem.searchController?.view.backgroundColor = UIColor.white
        
        searchController.searchBar.searchTextField.backgroundColor = UIColor.hc.lightgray
        let backgroundImage = getImageWithCustomColor(color: UIColor.clear, size: CGSize(width: bannerWidth!-60, height: bannerHeight!-18))
        //390, 44
        searchController.searchBar.setSearchFieldBackgroundImage(backgroundImage, for: .normal)
        searchController.searchBar.searchTextField.layer.cornerRadius = 10
        searchController.searchBar.layer.masksToBounds = true

//        searchController.searchBar.layer.cornerRadius = 10
//        searchController.searchBar.layer.masksToBounds = true
//        searchController.searchBar.snp.makeConstraints { make in
//            make.bottom.equalTo(navigationController?.navigationBar.snp.bottom!).inset(-10)
//        }
//        searchController.searchBar.frame.size.equalTo(CGSize(width: bannerWidth!-50, height: bannerHeight!-30))
//        searchController.searchBar.heightAnchor.constraint(equalToConstant: 10)
        
    }
    
    override func viewDidLayoutSubviews() {
        searchController.searchBar.layoutIfNeeded()
        searchController.searchBar.layoutSubviews()
        
        
        searchController.searchBar.searchTextField.font = .systemFont(ofSize: 14)
        //Your custom text size
        
        searchController.searchBar.layoutIfNeeded()
        searchController.searchBar.layoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = false

            let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.hc.darkNavy

//            appearance.backgroundColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
 //       appearance.backgroundColor = UIColor.hc.babyBlue
//            appearance.backgroundColor = UIColor.systemPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            clubCollectionView.reloadData()
    }
    
    //MARK: Networking
    
//    @objc private func getFilters() {
//        NetworkManager.shared.fetchCategories { [weak self] categories in
//            guard let self = self else { return }
//            self.filter = categories.categories
//            
//            DispatchQueue.main.async {
//                self.filterCollectionView.reloadData()
//                self.refreshControl.endRefreshing()
//            }
//            
//        } // the thing in the brackets is a function we pass it into completion, it retrieves as posts
//    }
    
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
        
        
//        refreshControl.addTarget(self, action: #selector(getFilters), for: .valueChanged)
//        filterCollectionView.refreshControl = refreshControl
//
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
        
        refreshControl.addTarget(self, action: #selector(getClubs), for: .valueChanged)
        clubCollectionView.refreshControl = refreshControl
        
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
        
        if collectionView == filterCollectionView {
            let selectedFilter = self.filter[indexPath.row]
            filterSelected = selectedFilter
            selected_clubs = clubs
            if selectedFilter == "all"{
                selected_clubs = clubs
            } else {
                let ls = clubs.filter ({ $0.category.name == selectedFilter})
                selected_clubs = ls
                
            }
            clubCollectionView.reloadData()
            filterCollectionView.reloadData()
        }else if collectionView == clubCollectionView{
            let clubss = selected_clubs[indexPath.row]
            let selectedItem = self.selected_clubs[indexPath.row]
            
            let detailedVC = DetailedVC(club_name: selectedItem.club_name,description:selectedItem.description, month: selectedItem.month, day: selectedItem.day, year: selectedItem.year, app_link: selectedItem.app_link, club_link: selectedItem.club_link, image_link: selectedItem.image_link, second_image_link: selectedItem.second_image_link, chat_link: selectedItem.chat_link,minute: selectedItem.minute, hour: selectedItem.hour, category: selectedItem.category, club: clubss)
            detailedVC.delegate = self
            navigationController?.pushViewController(detailedVC, animated: true)
            
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
    
    func getImageWithCustomColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
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
//                print(UserDefaults.standard.array(forKey: "starred") as? [String] ?? [])
            }
            clubCollectionView.reloadData()
        }
    
    
    }

// delegation
protocol starredClubsDelegate: AnyObject {
    func updateStarred(clubName: String)
}

extension FeedVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        if text == ""{
            selected_clubs = clubs
        }
        selected_clubs = clubs.filter({ club in
            club.club_name.contains(text)
        })
        

        clubCollectionView.reloadData()

    }

}



