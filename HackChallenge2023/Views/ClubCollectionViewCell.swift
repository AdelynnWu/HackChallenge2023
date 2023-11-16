//
//  ClubCollectionViewCell.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit

class ClubCollectionViewCell: UICollectionViewCell {
    private let club_name = UILabel()
    private let descriptions = UILabel()
    //private let category_id = UILabel()
    private let deadline = UILabel()
    private let image = UIImageView()
    private var club: Club?
        
    static let reuse: String = "ClubViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // Do any additional setup after loading the view.
        backgroundColor = UIColor.white
        setUpImage()
        setUpDeadline()
        setUpClubName()
        setUpDescription()
        //setUpCategoryId()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configure(club: Club){
        image.sd_setImage(with: URL(string: club.imageUrl))
        club_name.text = club.club_name
        descriptions.text = club.descriptions
        //category_id.text = club.category_id
        deadline.text = club.deadline
        
        
        self.club = club
    }
    private func setUpImage(){
        image.contentMode = .scaleAspectFit
        image.sd_setImage(with: URL(string: club?.imageUrl ?? ""))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        contentView.addSubview(image)
        
        image.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(26.5)
            make.size.equalTo(50)
        }
    }
    
    private func setUpClubName(){
        club_name.textColor = UIColor.black
        club_name.font = .systemFont(ofSize: 16, weight: .semibold)
        club_name.numberOfLines = 1
        
        contentView.addSubview(club_name)
        
        club_name.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(14)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    private func setUpDescription(){
        descriptions.textColor = UIColor.black
        descriptions.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptions.numberOfLines = 4
        
        contentView.addSubview(descriptions)
        
        descriptions.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(14)
            make.top.equalTo(club_name.snp.bottom).offset(7)
            make.width.equalTo(243)
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
    private func setUpDeadline(){
        deadline.textColor = UIColor.black
        deadline.font = .systemFont(ofSize: 12, weight: .semibold)
        deadline.numberOfLines = 1
        
        contentView.addSubview(deadline)
        
        deadline.snp.makeConstraints{ make in
            make.leading.equalTo(image.snp.trailing).offset(14)
            make.top.equalTo(descriptions.snp.bottom).offset(7)
            make.width.equalTo(50)
        }
    }
    
    
}
