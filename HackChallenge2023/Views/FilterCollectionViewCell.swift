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
    
    static let reuse: String = "FilterViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // Do any additional setup after loading the view.
        layer.cornerRadius = 16
        backgroundColor = UIColor.systemRed
        setUpCategory_Id()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Configure
    func configure(category_ids: String){
        category_id.text = category_ids
    }
    private func setUpCategory_Id(){
        category_id.font = .systemFont(ofSize: 12, weight: .semibold)
        category_id.textColor = UIColor.white
        category_id.numberOfLines = 1
        
        contentView.addSubview(category_id)
        
        category_id.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            
        }
    }
    
}
