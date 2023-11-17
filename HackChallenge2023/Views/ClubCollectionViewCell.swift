//
//  ClubCollectionViewCell.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SDWebImage
import SnapKit
import SwiftUI

class ClubCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties (views)
    private let club_name = UILabel()
    private let descriptions = UILabel()
    private let deadline = UILabel()
    private let image = UIImageView()
    private var club: Club?
    private let clockIconView = UIImageView()
    private let starButton = UIButton()
    
    //MARK: - Properties (data)
    static let reuse: String = "ClubCollectionViewCellReuseIdentifier"
    private var clubName: String = ""
    weak var delegate: starredClubsDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // Do any additional setup after loading the view.
        backgroundColor = UIColor.hc.white
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.hc.offWhite.cgColor
        
        setUpImage()
        setUpClubName()
        setUpDescription()
        setUpDeadline()
        setUpClockIcon()
        setupStarButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configure(club: Club, starred: Bool){
        self.clubName = club.club_name
        
        image.sd_setImage(with: URL(string: club.imageUrl))
        club_name.text = club.club_name
        descriptions.text = club.descriptions
        deadline.text = club.deadline
        
        if starred{
            // is starred
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            starButton.tintColor = UIColor.hc.yellowOrange
        } else {
            // not starred
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starButton.tintColor = UIColor.hc.gray
        }

    }
    
    private func setUpImage(){
        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = 10
//        image.clipsToBounds = true
        
        contentView.addSubview(image)
        
        image.snp.makeConstraints {make in
//            make.leading.equalToSuperview().offset(10)
//            make.top.equalToSuperview().offset(26.5)
//            make.size.equalTo(50)
            make.top.equalToSuperview().offset(26.5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(267)
            make.height.equalTo(50)
        }
    }
    
    private func setUpClubName(){
        club_name.textColor = UIColor.black
        club_name.font = .systemFont(ofSize: 16, weight: .semibold)
        club_name.numberOfLines = 1
        
        contentView.addSubview(club_name)
        
        club_name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(74)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    private func setUpDescription(){
        descriptions.textColor = UIColor.black
        descriptions.font = .systemFont(ofSize: 10)
        descriptions.numberOfLines = 3
        descriptions.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
//            make.leading.equalTo(image.snp.trailing).offset(14)
//            make.top.equalTo(club_name.snp.bottom).offset(7)
//            make.width.equalTo(243)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(36)
        }
    }

    private func setUpDeadline(){
        deadline.textColor = UIColor.hc.gray
        deadline.font = .systemFont(ofSize: 12, weight: .semibold)
        deadline.numberOfLines = 1
        
        contentView.addSubview(deadline)
        
        deadline.snp.makeConstraints{ make in
            make.leading.equalTo(image.snp.trailing).offset(34)
            make.top.equalToSuperview().offset(80)
            make.width.equalTo(75)
        }
    }
    
    private func setUpClockIcon(){
        
        clockIconView.image = UIImage(systemName: "clock")
        clockIconView.tintColor = UIColor.hc.gray
        
        contentView.addSubview(clockIconView)
        
        clockIconView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalTo(club_name.snp.leading)
            make.size.equalTo(14)
        }
    }
    
    private func setupStarButton(){
        
        contentView.addSubview(starButton)
        
        // button being clicked -> call func
        starButton.addTarget(self, action: #selector(starClub), for: .touchUpInside)
        starButton.isUserInteractionEnabled = true
        
        starButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(19)
        }
        
    }
    
    @objc func starClub(){
     
        delegate?.updateStarred(clubName: clubName)
        
    }
    
}




//    private func setUpCategoryId(){
//        category_id.textColor = UIColor.black
//        category_id.font = .systemFont(ofSize: 12, weight: .semibold)
//        category_id.numberOfLines = 4
//        category_id.layer.cornerRadius = 16
//        category_id.backgroundColor = UIColor.systemGray
//
//        contentView.addSubview(category_id)
//
//        category_id.snp.makeConstraints { make in
//            make.leading.equalTo(club_name.snp.trailing).offset(5)
//            make.top.equalToSuperview().offset(4)
//            make.width.equalTo(100)
//        }
//    }
