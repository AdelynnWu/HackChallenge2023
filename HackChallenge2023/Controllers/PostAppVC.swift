//
//  PostAppVC.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import UIKit
import SnapKit
import SwiftUI
// for posting new application
class PostAppVC: UIViewController {
    
    // MARK: - Properties Views
    private let orgNameLabel = UILabel()
    private let orgNameTextField = UITextField()
    private let uploadImageLabel = UILabel()
    private let uploadImageButton = UIButton()
    private let categoryLabel = UILabel()
    //category cells?
    private let appLinkLebel = UILabel()
    private let appLinkTextField = UITextField()
    private let appDeadlineLebel = UILabel()
    private let appDeadlineTextField = UITextField()
    private let coffeeChatLebel = UILabel()
    private let coffeeChatField = UITextField()
    private let postButton = UIButton()
    
    // MARK: - Properties Data
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Post Application"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        setupOrgNameLabel()
        setupOrgNameTextField()
        setupUploadImageLabel()
        setupUploadImageButton()
        setupCategoryLabel()
        
    }
    
    // MARK: - Networking
    
    // MARK: - setup views
    private func setupOrgNameLabel(){
        orgNameLabel.text = "Organization Name*"
        orgNameLabel.textColor = UIColor.hc.black
        orgNameLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(orgNameLabel)
        
        orgNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupOrgNameTextField(){
//        orgNameTextField.placeholder = ""
        orgNameTextField.font = .systemFont(ofSize: 14)
        orgNameTextField.layer.borderWidth = 0.2
        orgNameTextField.layer.borderColor = UIColor.hc.black.cgColor
        orgNameTextField.layer.cornerRadius = 10
        orgNameTextField.layer.masksToBounds = true
        view.addSubview(orgNameTextField)
        
        orgNameTextField.snp.makeConstraints { make in
            make.top.equalTo(orgNameLabel.snp.bottom).offset(9)
            make.leading.equalTo(orgNameLabel)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
        
    }
    
    private func setupUploadImageLabel(){
        uploadImageLabel.text = "Upload Image"
        uploadImageLabel.textColor = UIColor.hc.black
        uploadImageLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(uploadImageLabel)
        
        uploadImageLabel.snp.makeConstraints { make in
            make.leading.equalTo(orgNameLabel)
            make.top.equalTo(orgNameTextField.snp.bottom).offset(12)
        }
    }
    
    private func setupUploadImageButton(){
        uploadImageButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        uploadImageLabel.tintColor = UIColor.hc.gray
        
        view.addSubview(uploadImageButton)
        
        uploadImageButton.snp.makeConstraints { make in
            make.leading.equalTo(orgNameLabel)
            make.top.equalTo(uploadImageLabel.snp.bottom).offset(10)
            make.size.equalTo(74)
            // change size of icon and add padding
        }
    }
    
    private func setupCategoryLabel(){
        categoryLabel.text = "Category"
        categoryLabel.textColor = UIColor.hc.black
        categoryLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(orgNameLabel)
            make.top.equalTo(uploadImageLabel.snp.bottom).offset(96)
        }
    }
    
    private func setupAppLinkLabel(){}
    
    private func setupAppLinkTextField(){}
    
    private func setupAppDeadlineLabel(){}
    
    private func setupAppDeadlineTextField(){}
    
    private func setupCoffeeChatLabel(){}
    
    private func setupCoffeeChatTextField(){}
    
    private func setupPostButton(){}
    
    
    
    
}
