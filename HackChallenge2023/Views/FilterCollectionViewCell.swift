//
//  FilterCollectionViewCell.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import SnapKit
import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    private let category_id = UILabel()
    
    static let reuse: String = "FilterCollectionViewCellReuseIdentifier"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // Do any additional setup after loading the view.
//        layer.cornerRadius = 16
//        backgroundColor = UIColor.systemRed
        
        setUpCategory_Id()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Configure
    func configure(category: String, filterSelected: String){
        category_id.text = category
        
        if filterSelected == category {
//            category_id.backgroundColor = UIColor(red: 73/255, green: 207/255, blue: 204/255, alpha: 1.0)
            category_id.backgroundColor = UIColor.hc.darkNavy
            category_id.textColor = UIColor.white
        } else {
//            category_id.backgroundColor = UIColor(red: 198/255, green: 237/255, blue: 235/255, alpha: 1.0)
            category_id.backgroundColor = UIColor.hc.postWhite
//            category_id.textColor = UIColor(red: 28/255, green: 132/255, blue: 130/255, alpha: 1.0)
            category_id.textColor = UIColor.hc.black
        }
    }
    
    
    private func setUpCategory_Id(){
        category_id.font = .systemFont(ofSize: 12)
        category_id.textColor = UIColor.black
//        category_id.numberOfLines = 1
        category_id.textAlignment = .center
        category_id.layer.cornerRadius = 16
        category_id.clipsToBounds = true
//        category_id.layer.borderColor = UIColor.hc.yellowOrange.cgColor
//        category_id.layer.borderWidth = 1
        category_id.backgroundColor = UIColor.hc.postWhite
        
        contentView.addSubview(category_id)
        
        category_id.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(8)
            make.edges.equalToSuperview()
            
        }
    }
    
}
