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
    private let appLinkLabel = UILabel()
    private let appLinkTextField = UITextField()
    private let appDeadlineLabel = UILabel()
    private let appDeadlineTextField = UITextField()
    private let websiteLinkLabel = UILabel()
    private let websiteLinkTextfield = UITextField()
    private let coffeeChatLabel = UILabel()
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
        setupAppLinkLabel()
        setupAppLinkTextField()
        setupAppDeadlineLabel()
        setupAppDeadlineTextField()
        setupWebsiteLinkLabel()
        setupWebsiteLinkTextField()
        setupCoffeeChatLabel()
        setupCoffeeChatTextField()
        
        //Date Picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector( selectDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.minimumDate = Date()
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            // Fallback on earlier versions
        }
        
        appDeadlineTextField.inputView = datePicker
        
    }
    override func viewWillAppear(_ animated: Bool) {

            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = true

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 1, green: 112/255, blue: 103/255, alpha: 1.0)
//            appearance.backgroundColor = UIColor.systemPink
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
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
    
    private func setupAppLinkLabel(){
        appLinkLabel.text = "Application Link*"
        appLinkLabel.textColor = UIColor.hc.black
        appLinkLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(appLinkLabel)
        
        appLinkLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(categoryLabel.snp.bottom).offset(97)
        }
    }
    
    private func setupAppLinkTextField(){
        appLinkTextField.font = .systemFont(ofSize: 14)
        appLinkTextField.layer.borderWidth = 0.2
        appLinkTextField.layer.borderColor = UIColor.hc.black.cgColor
        appLinkTextField.layer.cornerRadius = 10
        appLinkTextField.layer.masksToBounds = true
        
        view.addSubview(appLinkTextField)
        
        appLinkTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(appLinkLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    
    private func setupAppDeadlineLabel(){
        appDeadlineLabel.text = "Application Deadline*"
        appDeadlineLabel.textColor = UIColor.hc.black
        appDeadlineLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(appDeadlineLabel)
        
        appDeadlineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(appLinkTextField.snp.bottom).offset(12)
        }
        
    }
    
    private func setupAppDeadlineTextField(){
//        appDeadlineTextField.text = formatDate(date: Date())  today's date
        appDeadlineTextField.font = .systemFont(ofSize: 14)
        appDeadlineTextField.layer.borderWidth = 0.2
        appDeadlineTextField.layer.borderColor = UIColor.hc.black.cgColor
        appDeadlineTextField.layer.cornerRadius = 10
        appDeadlineTextField.layer.masksToBounds = true
        
        view.addSubview(appDeadlineTextField)
        
        appDeadlineTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(appDeadlineLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    
    private func setupWebsiteLinkLabel(){
        websiteLinkLabel.text = "Organization Website Link"
        websiteLinkLabel.textColor = UIColor.hc.black
        websiteLinkLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(websiteLinkLabel)
        
        websiteLinkLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(appDeadlineTextField.snp.bottom).offset(12)
        }
    }
    
    private func setupWebsiteLinkTextField(){
        websiteLinkTextfield.placeholder = "optional"
        websiteLinkTextfield.font = .systemFont(ofSize: 14)
        websiteLinkTextfield.layer.borderWidth = 0.2
        websiteLinkTextfield.layer.borderColor = UIColor.hc.black.cgColor
        websiteLinkTextfield.layer.cornerRadius = 10
        websiteLinkTextfield.layer.masksToBounds = true
        
        view.addSubview(websiteLinkTextfield)
        
        websiteLinkTextfield.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(websiteLinkLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    
    private func setupCoffeeChatLabel(){
        coffeeChatLabel.text = "Coffee Chat Registration Link"
        coffeeChatLabel.textColor = UIColor.hc.black
        coffeeChatLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(coffeeChatLabel)
        
        coffeeChatLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(websiteLinkTextfield.snp.bottom).offset(12)
        }
    }
    
    private func setupCoffeeChatTextField(){
        coffeeChatField.placeholder = "optional"
        coffeeChatField.font = .systemFont(ofSize: 14)
        coffeeChatField.layer.borderWidth = 0.2
        coffeeChatField.layer.borderColor = UIColor.hc.black.cgColor
        coffeeChatField.layer.cornerRadius = 10
        coffeeChatField.layer.masksToBounds = true
        
        view.addSubview(coffeeChatField)
        
        coffeeChatField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(coffeeChatLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    
    private func setupPostButton(){}
    
    
    // select application deadline
    @objc func selectDate(datePicker: UIDatePicker){
        appDeadlineTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter.string(from: date)
    }
    
}


