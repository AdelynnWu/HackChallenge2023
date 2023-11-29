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
        setUpClubName()
        setUpDeadLineLabel()
        setUpImage()
        setUpDeadline()
        setUpAppLinkLabel()
        setUpAppLink()
        setUpClubLinkLabel()
        setUpClublink()
        setUpDescriptionLabel()
        setUpDescription()
        
    }
    
    init(club_name: String,description:String, month: Int, day: Int, year: Int, app_link: String, club_link: String, club: Club) {
        
        self.club_name.text = club_name
        self.descriptions.text = description
        self.month.text = String(month)
        self.day.text = String(day)
        self.year.text = String(year)
        self.deadline.text = String(club.month)+"/"+String(club.day)+"/"+String(club.year)
      //  self.image.sd_setImage(with: URL(string: image))
        self.app_link.text = app_link
        self.club_link.text = club_link
        
        self.club = club
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup views
    private func setUpClubName() {
        club_name.textColor = UIColor.hc.black
        club_name.font = UIFont(name: "Lora-SemiBold", size:35)
        club_name.numberOfLines = 2
        club_name.lineBreakMode = .byWordWrapping
        
        view.addSubview(club_name)
        
        club_name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    private func setUpImage() {
        
    }
    private func setUpDeadLineLabel() {
        deadlineLabel.textColor = UIColor.hc.black
        deadlineLabel.text = "Deadline: "
        deadlineLabel.font = UIFont(name: "Lora-SemiBold", size:15)
        deadlineLabel.numberOfLines = 1
        
        view.addSubview(deadlineLabel)
        
        deadlineLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(club_name.snp.bottom).offset(30)
        }
    }
    private func setUpDeadline(){
       // deadline.text = String(club.month)+"/"+String(club.day)+"/"+String(club.year)
        deadline.textColor = UIColor.hc.black
        deadline.font = UIFont(name: "Lora-SemiBold", size:15)
        deadline.numberOfLines = 1
        
        view.addSubview(deadline)
        
        deadline.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(280)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(club_name.snp.bottom).offset(30)
        }
    }
    private func setUpAppLinkLabel() {
        appLinkLabel.text = "Application Link:"
        appLinkLabel.font = UIFont(name: "Lora-SemiBold", size:15)
        appLinkLabel.numberOfLines = 1
        
        view.addSubview(appLinkLabel)
        
        appLinkLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(deadline.snp.bottom).offset(30)
        }
    }
    private func setUpAppLink() {
        app_link.font = UIFont(name: "Lora-SemiBold", size:15)
        app_link.textColor = UIColor.blue
        app_link.numberOfLines = 4
        app_link.lineBreakMode = .byWordWrapping
        
        view.addSubview(app_link)
        
        app_link.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(appLinkLabel.snp.bottom).offset(3)
        }
    }
    private func setUpClubLinkLabel() {
        clubLinkLabel.text = "Club website Link:"
        clubLinkLabel.font = UIFont(name: "Lora-SemiBold", size:15)
        clubLinkLabel.numberOfLines = 1
        
        view.addSubview(clubLinkLabel)
        
        clubLinkLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(deadline.snp.bottom).offset(100)
        }
    }
    private func setUpClublink() {
        club_link.font = UIFont(name: "Lora-SemiBold", size:15)
        club_link.textColor = UIColor.blue
        club_link.numberOfLines = 4
        club_link.lineBreakMode = .byWordWrapping
        
        view.addSubview(club_link)
        
        club_link.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(clubLinkLabel.snp.bottom).offset(3)
        }
    }
    private func setUpDescriptionLabel() {
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont(name: "Lora-SemiBold", size:20)
        descriptionLabel.numberOfLines = 1
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(club_link.snp.bottom).offset(5)
        }
    }
    private func setUpDescription() {
        descriptions.font = UIFont(name: "Lora-SemiBold", size:14)
        descriptions.numberOfLines = 10
        descriptions.lineBreakMode = .byWordWrapping
        
        view.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        }
    }
    
}
