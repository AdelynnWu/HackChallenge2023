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
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        self.layer.cornerRadius = 10
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.hc.offWhite.cgColor
        
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 1.0)
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 0.5
//        layer.masksToBounds = false
        
        
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
        
        image.sd_setImage(with: URL(string: club.image_link))
        club_name.text = club.club_name
        descriptions.text = club.description
        deadline.text = String(club.month)+"/"+String(club.day)+"/"+String(club.year)
        
        if starred{
            // is starred
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
 //           starButton.tintColor = UIColor.hc.pastelBlue
            starButton.tintColor = UIColor(red: 246/255, green: 188/255, blue: 102/255, alpha: 1.0)
        } else {
            // not starred
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starButton.tintColor = UIColor.hc.gray
        }
        
        starButton.addTarget(self, action: #selector(starClub), for: .touchUpInside)

    }
    
    private func setUpImage(){
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
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
        club_name.textColor = UIColor.hc.black
        //club_name.font = .systemFont(ofSize: 16, weight: .semibold)
        club_name.font = UIFont(name: "Lora-SemiBold", size:16)
        club_name.numberOfLines = 1
        
        contentView.addSubview(club_name)
        
        club_name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(74)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    private func setUpDescription(){
        descriptions.textColor = UIColor.hc.black
        descriptions.font = .systemFont(ofSize: 12)
        descriptions.numberOfLines = 3
        descriptions.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
//            make.leading.equalTo(image.snp.trailing).offset(14)
//            make.top.equalTo(club_name.snp.bottom).offset(7)
//            make.width.equalTo(243)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(31)
        }
    }

    private func setUpDeadline(){
        deadline.textColor = UIColor.hc.gray
        deadline.font = .systemFont(ofSize: 12, weight: .semibold)
        deadline.numberOfLines = 1
        
        contentView.addSubview(deadline)
        
        deadline.snp.makeConstraints{ make in
            make.leading.equalTo(image.snp.trailing).offset(34)
            make.top.equalToSuperview().offset(90)
            make.width.equalTo(75)
        }
    }
    
    private func setUpClockIcon(){
        
        clockIconView.image = UIImage(systemName: "clock")
        clockIconView.tintColor = UIColor.hc.gray
        
        contentView.addSubview(clockIconView)
        
        clockIconView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalTo(club_name.snp.leading)
            make.size.equalTo(14)
        }
    }
    
    private func setupStarButton(){
        
        contentView.addSubview(starButton)
        
        // button being clicked -> call func
        starButton.addTarget(self, action: #selector(starClub), for: .touchUpInside)
        // don't know why animation applies to another cell's star button when one is clicked
//        starButton.addTarget(self, action: #selector(starAnimation), for: .touchUpInside)
        starButton.isUserInteractionEnabled = true
        
        starButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(19)
        }
        
    }
    
    @objc func starClub(){
        UIButton.animate(withDuration: 0.6, animations: {self.starButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)}, completion: { (finish) in
            UIButton.animate(withDuration: 0.6, animations: { [self] in
                self.starButton.transform = CGAffineTransform.identity
                self.delegate?.updateStarred(clubName: self.clubName)
            })
        }
        )
        
    }
    
//    @objc private func starAnimation(){
//        UIButton.animate(withDuration: 0.6, animations: {self.starButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)}, completion: { (finish) in
//            UIButton.animate(withDuration: 0.6, animations: {
//                self.starButton.transform = CGAffineTransform.identity
//            })
//        }
//        )
//    }
    
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
