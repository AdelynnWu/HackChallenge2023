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
import SafariServices

// for detailed page of the application/club

class DetailedVC: UIViewController {
    
    // MARK: - Properties (views)
    private let club_name = UILabel()
    private let descriptions = UILabel()
    private let month = UILabel()
    private let day = UILabel()
    private let year = UILabel()
    private let deadline = UILabel()
    private let image = UIImageView()
    
    private let app_link = UILabel()
    private let club_link = UILabel()
    private let deadlineLabel = UILabel()
    private let appLinkLabel = UILabel()
    private let clubLinkLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let appIconView = UIImageView()
    private let applicationIconView = UIImageView()
    private let coffeeIconView = UIImageView()
    private let websiteIconView = UIImageView()
    private let chat_link = UILabel()
    private let chat_label = UILabel()
    private let app_button = UIButton()
    private let website_button = UIButton()
    private let chat_button = UIButton()
    private let website_descrip = UILabel()
    private let chat_descrip = UILabel()
    private let category_label = UILabel()
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.hc.white
        return sv
    }()
    
    private let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hc.white
        return v
    }()
    
    // MARK: - Properties (data)
    var club: Club
    
    // MARK: init and viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        view.backgroundColor = UIColor.hc.white
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [

                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    //UIColor(red: 174/255, green: 93/255, blue: 246/255, alpha: 1.0).cgColor,
                ]
        view.layer.addSublayer(gradientLayer)
        
        setupUI()
        setUpImage()
        setUpClubName()
        //setUpCategoryLabel()
        setUpDescription()

        setUpApplicationIconView()
        setUpAppLinkLabel()
        setUpDeadline()
        setUpAppButton()
        setUpClubIconView()
        setUpClubLinkLabel()
        setUpWebsiteDescrip()
        setUpClubButton()
        setUpChatIcon()
        setUpCoffeeChatLabel()
        setUpChatDescrip()
        setUpCoffeeButton()
   
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.clear
    }
    
    init(club_name: String,description:String, month: Int, day: Int, year: Int, app_link: String, club_link: String, image_link: String,chat_link: String,category: Category,club: Club) {
        
        self.image.sd_setImage(with: URL(string: club.image_link))

        self.club_name.text = club_name
        self.descriptions.text = description
        self.month.text = String(month)
        self.day.text = String(day)
        self.year.text = String(year)
        self.deadline.text = String(club.month)+"/"+String(club.day)+"/"+String(club.year)
      //  self.image.sd_setImage(with: URL(string: image))
        self.app_link.text = app_link
        self.club_link.text = club_link
        self.chat_link.text = chat_link
//       self.category_label.text = category as! String
        self.club = club
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup views
    
    private func setupUI(){
        self.view.backgroundColor = UIColor.hc.white
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).multipliedBy(2)
        }
        
    }
    
    private func setUpImage() {
        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = 10
//        image.clipsToBounds = true
        
       view.addSubview(image)
        
        image.snp.makeConstraints {make in
//            make.leading.equalToSuperview().offset(10)
//            make.top.equalToSuperview().offset(26.5)
//            make.size.equalTo(50)
            make.top.equalTo(contentView).offset(200)
            make.leading.equalTo(contentView).offset(24)
            make.size.equalTo(70)
        }
    }
    private func setUpClubName() {
        club_name.textColor = UIColor.hc.black
        club_name.font = UIFont(name: "Lora-SemiBold", size:35)
        club_name.numberOfLines = 2
        club_name.lineBreakMode = .byWordWrapping
        
        view.addSubview(club_name)
        
        club_name.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
    }
    private func setUpCategoryLabel() {
        category_label.backgroundColor = UIColor.hc.white
        category_label.layer.cornerRadius = 20
        category_label.layer.borderWidth = 1
        category_label.layer.borderColor = UIColor.hc.orangeRed.cgColor
        category_label.textColor = UIColor.hc.orangeRed
        category_label.font = .systemFont(ofSize: 10, weight: .semibold)
    

        view.addSubview(category_label)
        
        category_label.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.leading.equalTo(club_name.snp.trailing).offset(12)
            make.height.equalTo(20)
            make.width.equalTo(78)
        }
    }
    private func setUpDescription() {
        descriptions.font = .systemFont(ofSize: 14)
        descriptions.numberOfLines = 10
        descriptions.lineBreakMode = .byWordWrapping
        
        view.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(club_name.snp.bottom).offset(12)
        }
    }
//    private func setUpAppIconView() {
//        appIconView.image = UIImage(systemName: "clock")
//        appIconView.tintColor = UIColor.hc.gray
//
//        view.addSubview(appIconView)
//
//        appIconView.snp.makeConstraints {make in
//            make.top.equalTo(descriptions.snp.bottom).offset(60)
//            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
//            make.size.equalTo(20)
//        }
//    }
//    private func setUpDeadLineLabel() {
//        deadlineLabel.textColor = UIColor.hc.black
//        deadlineLabel.text = "Deadline"
//        deadlineLabel.font = UIFont(name: "Lora-SemiBold", size:20)
//        deadlineLabel.numberOfLines = 1
//
//        view.addSubview(deadlineLabel)
//
//        deadlineLabel.snp.makeConstraints { make in
//            make.leading.equalTo(appIconView.snp.trailing).offset(3)
//            make.trailing.equalToSuperview().inset(10)
//            make.top.equalTo(descriptions.snp.bottom).offset(60)
//        }
//    }

    private func setUpApplicationIconView() {
        applicationIconView.image = UIImage(systemName: "square.and.pencil")
        applicationIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(applicationIconView)
        
        applicationIconView.snp.makeConstraints {make in
            make.top.equalTo(descriptions.snp.bottom).offset(60)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.size.equalTo(20)
        }
    }
    private func setUpAppLinkLabel() {
        appLinkLabel.text = "Application "
        appLinkLabel.font = UIFont(name: "Lora-SemiBold", size:20)
        appLinkLabel.numberOfLines = 1
        
        view.addSubview(appLinkLabel)
        
        appLinkLabel.snp.makeConstraints { make in
            make.leading.equalTo(applicationIconView.snp.trailing).offset(3)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(descriptions.snp.bottom).offset(60)
        }
    }
    private func setUpDeadline(){
        deadline.text = "The last day to apply is: " + String(club.month)+"/"+String(club.day)+"/"+String(club.year)
        deadline.textColor = UIColor.gray
        deadline.font = UIFont(name: "Lora-SemiBold", size:12)
        deadline.numberOfLines = 1
        
        view.addSubview(deadline)
        
        deadline.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(appLinkLabel.snp.bottom).offset(8)
        }
    }
    private func setUpAppButton() {
        app_button.backgroundColor = UIColor.hc.white
        app_button.layer.cornerRadius = 20
        app_button.layer.borderWidth = 1
        app_button.layer.borderColor = UIColor.hc.orangeRed.cgColor
        app_button.setTitle("Application link", for: .normal)
        app_button.setTitleColor(UIColor.hc.orangeRed, for: .normal)
        app_button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        app_button.addTarget(self, action: #selector(selectorApp), for: .touchUpInside)

        view.addSubview(app_button)
        
        app_button.snp.makeConstraints { make in
            make.top.equalTo(deadline.snp.bottom).offset(24)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(92)
            make.height.equalTo(40)
            make.width.equalTo(187)
        }
    }
    private func setUpClubIconView() {
        websiteIconView.image = UIImage(systemName: "link")
        websiteIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(websiteIconView)
        
        websiteIconView.snp.makeConstraints {make in
            make.top.equalTo(app_button.snp.bottom).offset(7)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.size.equalTo(20)
        }
    }
    private func setUpClubLinkLabel() {
        clubLinkLabel.text = "Club Website"
        clubLinkLabel.font = UIFont(name: "Lora-SemiBold", size:20)
        clubLinkLabel.numberOfLines = 1
        
        view.addSubview(clubLinkLabel)
        
        clubLinkLabel.snp.makeConstraints { make in
            make.leading.equalTo(websiteIconView.snp.trailing).offset(3)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(app_button.snp.bottom).offset(7)
        }
    }
    private func setUpWebsiteDescrip(){
        website_descrip.text = "Visit our website for more info"
        website_descrip.textColor = UIColor.gray
        website_descrip.font = UIFont(name: "Lora-SemiBold", size:12)
        website_descrip.numberOfLines = 1
        
        view.addSubview(website_descrip)
        
        website_descrip.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(clubLinkLabel.snp.bottom).offset(8)
        }
    }
    private func setUpClubButton() {
        website_button.backgroundColor = UIColor.hc.white
        website_button.layer.cornerRadius = 20
        website_button.layer.borderWidth = 1
        website_button.layer.borderColor = UIColor.hc.orangeRed.cgColor
        website_button.setTitle("Website Link", for: .normal)
        website_button.setTitleColor(UIColor.hc.orangeRed, for: .normal)
        website_button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        website_button.addTarget(self, action: #selector(selectorWebsite), for: .touchUpInside)

        view.addSubview(website_button)
        
        website_button.snp.makeConstraints { make in
            make.top.equalTo(website_descrip.snp.bottom).offset(27)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(92)
            make.height.equalTo(40)
            make.width.equalTo(187)
        }
    }
    private func setUpChatIcon() {
        coffeeIconView.image = UIImage(systemName: "cup.and.saucer")
        coffeeIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(coffeeIconView)
        
        coffeeIconView.snp.makeConstraints {make in
            make.top.equalTo(website_button.snp.bottom).offset(7)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.size.equalTo(20)
        }
    }
    private func setUpCoffeeChatLabel() {
        chat_label.text = "Coffee Chat"
        chat_label.font = UIFont(name: "Lora-SemiBold", size:20)
        chat_label.numberOfLines = 1
        
        view.addSubview(chat_label)
        
        chat_label.snp.makeConstraints { make in
            make.leading.equalTo(coffeeIconView.snp.trailing).offset(3)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(website_button.snp.bottom).offset(7)
        }
    }
    private func setUpChatDescrip() {
        chat_descrip.text = "Sign up for a coffee chat and get paired with a member"
        chat_descrip.textColor = UIColor.gray
        chat_descrip.font = UIFont(name: "Lora-SemiBold", size:12)
        chat_descrip.numberOfLines = 1
        
        view.addSubview(chat_descrip)
        
        chat_descrip.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(contentView).inset(10)
            make.top.equalTo(chat_label.snp.bottom).offset(8)
        }
    }
    
    private func setUpCoffeeButton() {
        chat_button.backgroundColor = UIColor.hc.white
        chat_button.layer.cornerRadius = 20
        chat_button.layer.borderWidth = 1
        chat_button.layer.borderColor = UIColor.hc.orangeRed.cgColor
        chat_button.setTitle("Coffee Chat Link", for: .normal)
        chat_button.setTitleColor(UIColor.hc.orangeRed, for: .normal)
        chat_button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        chat_button.addTarget(self, action: #selector(selectorCoffee), for: .touchUpInside)

        view.addSubview(chat_button)
        
        chat_button.snp.makeConstraints { make in
            make.top.equalTo(chat_descrip.snp.bottom).offset(27)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(92)
            make.height.equalTo(40)
            make.width.equalTo(187)
        }
    }
  
    
    @objc func selectorApp() {
        if let url = URL(string: app_link.text!)
     {

       let safariVC = SFSafariViewController(url: url)
       present(safariVC, animated: true, completion: nil)

     }
    }
    @objc func selectorWebsite() {
        if let url = URL(string: club_link.text!)
     {

       let safariVC = SFSafariViewController(url: url)
       present(safariVC, animated: true, completion: nil)

     }
    }
    @objc func selectorCoffee() {
        if let url = URL(string: chat_link.text!)
     {

       let safariVC = SFSafariViewController(url: url)
       present(safariVC, animated: true, completion: nil)

     }
    }

    
}
