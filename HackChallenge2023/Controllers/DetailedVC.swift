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
        
        
        setUpImage()
        setUpClubName()
        setUpDescription()
        setUpAppIconView()
        setUpDeadLineLabel()
        setUpDeadline()
        setUpApplicationIconView()
        setUpAppLinkLabel()
        setUpAppLink()
        setUpClubIconView()
        setUpClubLinkLabel()
        setUpClublink()
        setUpChatIcon()
        setUpCoffeeChatLabel()
        setUpCoffeeChatLink()
   
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.clear
    }
    
    init(club_name: String,description:String, month: Int, day: Int, year: Int, app_link: String, club_link: String, image_link: String,chat_link: String,club: Club) {
        
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
        self.club = club
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup views
    private func setUpImage() {
        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = 10
//        image.clipsToBounds = true
        
        view.addSubview(image)
        
        image.snp.makeConstraints {make in
//            make.leading.equalToSuperview().offset(10)
//            make.top.equalToSuperview().offset(26.5)
//            make.size.equalTo(50)
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(24)
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
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
    }
    private func setUpDescription() {
        descriptions.font = .systemFont(ofSize: 14)
        descriptions.numberOfLines = 10
        descriptions.lineBreakMode = .byWordWrapping
        
        view.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(club_name.snp.bottom).offset(12)
        }
    }
    private func setUpAppIconView() {
        appIconView.image = UIImage(systemName: "clock")
        appIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(appIconView)
        
        appIconView.snp.makeConstraints {make in
            make.top.equalTo(descriptions.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.size.equalTo(20)
        }
    }
    private func setUpDeadLineLabel() {
        deadlineLabel.textColor = UIColor.hc.black
        deadlineLabel.text = "Application"
        deadlineLabel.font = UIFont(name: "Lora-SemiBold", size:20)
        deadlineLabel.numberOfLines = 1
        
        view.addSubview(deadlineLabel)
        
        deadlineLabel.snp.makeConstraints { make in
            make.leading.equalTo(appIconView.snp.trailing).offset(3)
            make.trailing.equalToSuperview().inset(10)
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
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(deadlineLabel.snp.bottom).offset(8)
        }
    }
    private func setUpApplicationIconView() {
        applicationIconView.image = UIImage(systemName: "square.and.pencil")
        applicationIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(applicationIconView)
        
        applicationIconView.snp.makeConstraints {make in
            make.top.equalTo(deadline.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
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
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(deadline.snp.bottom).offset(24)
        }
    }
    private func setUpAppLink() {
        app_link.font = UIFont(name: "Lora-SemiBold", size:15)
        app_link.textColor = UIColor.blue
        app_link.numberOfLines = 4
        app_link.lineBreakMode = .byWordWrapping
        
        view.addSubview(app_link)
        
        app_link.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(appLinkLabel.snp.bottom).offset(24)
        }
    }
    private func setUpClubIconView() {
        websiteIconView.image = UIImage(systemName: "link")
        websiteIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(websiteIconView)
        
        websiteIconView.snp.makeConstraints {make in
            make.top.equalTo(app_link.snp.bottom).offset(7)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
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
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(app_link.snp.bottom).offset(7)
        }
    }
    private func setUpClublink() {
        club_link.font = UIFont(name: "Lora-SemiBold", size:15)
        club_link.textColor = UIColor.blue
        club_link.numberOfLines = 4
        club_link.lineBreakMode = .byWordWrapping
        
        view.addSubview(club_link)
        
        club_link.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(clubLinkLabel.snp.bottom).offset(7)
        }
    }
    private func setUpChatIcon() {
        coffeeIconView.image = UIImage(systemName: "cup.and.saucer")
        coffeeIconView.tintColor = UIColor.hc.gray
        
        view.addSubview(coffeeIconView)
        
        coffeeIconView.snp.makeConstraints {make in
            make.top.equalTo(club_link.snp.bottom).offset(7)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
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
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(club_link.snp.bottom).offset(7)
        }
    }
    private func setUpCoffeeChatLink() {
        chat_link.font = UIFont(name: "Lora-SemiBold", size:15)
        chat_link.textColor = UIColor.blue
        chat_link.numberOfLines = 4
        chat_link.lineBreakMode = .byWordWrapping
        
        view.addSubview(chat_link)
        
        chat_link.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(chat_label.snp.bottom).offset(7)
        }
    }


    
}
