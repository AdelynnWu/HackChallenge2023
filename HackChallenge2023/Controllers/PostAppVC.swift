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
    private let categoryTextField = UITextField()
    private let appLinkLabel = UILabel()
    private let appLinkTextField = UITextField()
    private let appDeadlineLabel = UILabel()
    private let appDeadlineTextField = UITextField()
    private let websiteLinkLabel = UILabel()
    private let websiteLinkTextfield = UITextField()
    private let coffeeChatLabel = UILabel()
    private let coffeeChatTextField = UITextField()
    private let descriptionLabel = UILabel()
    private let descriptionTextField = UITextField()
    private let postButton = UIButton()
    private let categoryPickerView = UIPickerView()
    private let uploadImageTextField = UITextField()
    
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
    
    // MARK: - Properties Data
    private let categories = filters
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Post Application"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [

                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor,
                    //UIColor(red: 174/255, green: 93/255, blue: 246/255, alpha: 1.0).cgColor,
                ]
        view.layer.addSublayer(gradientLayer)
        
        //pickerView
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        setupUI()
        setupOrgNameLabel()
        setupOrgNameTextField()
        setupUploadImageLabel()
        //setupUploadImageButton()
        setUpImageTextField()
        setupCategoryLabel()
        setupCategoryTextField()
        setupAppLinkLabel()
        setupAppLinkTextField()
        setupAppDeadlineLabel()
        setupAppDeadlineTextField()
        setupWebsiteLinkLabel()
        setupWebsiteLinkTextField()
        setupCoffeeChatLabel()
        setupCoffeeChatTextField()
        setupDescriptionLabel()
        setupDescriptionTextField()
        setupPostButton()
        
        //Date Picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector( selectDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.minimumDate = Date()
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        appDeadlineTextField.inputView = datePicker
        categoryTextField.inputView = categoryPickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {

            super.viewWillAppear(animated)
            navigationController?.navigationBar.prefersLargeTitles = true

            let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.hc.white
//            appearance.backgroundColor = UIColor.systemPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Networking
    
    // MARK: - setup views
    
    private func setupUI(){
        self.view.backgroundColor = UIColor.hc.white
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).multipliedBy(2)
        }
        
    }
    
    private func setupOrgNameLabel(){
        orgNameLabel.text = "Organization Name*"
        orgNameLabel.textColor = UIColor.hc.black
        orgNameLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(orgNameLabel)
        
        orgNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
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
    private func setUpImageTextField(){
        uploadImageTextField.font = .systemFont(ofSize: 14)
        uploadImageTextField.layer.borderWidth = 0.2
        uploadImageTextField.layer.borderColor = UIColor.hc.black.cgColor
        uploadImageTextField.layer.cornerRadius = 10
        uploadImageTextField.layer.masksToBounds = true
        
        view.addSubview(uploadImageTextField)
        
        uploadImageTextField.snp.makeConstraints { make in
            make.top.equalTo(uploadImageLabel.snp.bottom).offset(10)
            make.leading.equalTo(orgNameLabel)
            make.height.equalTo(33)
            make.width.equalTo(328)
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
    
    private func setupCategoryTextField(){
        categoryTextField.font = .systemFont(ofSize: 14)
        categoryTextField.layer.borderWidth = 0.2
        categoryTextField.layer.borderColor = UIColor.hc.black.cgColor
        categoryTextField.layer.cornerRadius = 10
        categoryTextField.layer.masksToBounds = true
        
        view.addSubview(categoryTextField)
        
        categoryTextField.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(9)
            make.leading.equalTo(categoryLabel)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
        
    }
    
    private func setupAppLinkLabel(){
        appLinkLabel.text = "Application Link*"
        appLinkLabel.textColor = UIColor.hc.black
        appLinkLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(appLinkLabel)
        
        appLinkLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.top.equalTo(categoryTextField.snp.bottom).offset(12)
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
            make.leading.equalTo(contentView).offset(24)
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
            make.leading.equalTo(contentView).offset(24)
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
            make.leading.equalTo(contentView).offset(24)
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
            make.leading.equalTo(contentView).offset(24)
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
            make.leading.equalTo(contentView).offset(24)
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
            make.leading.equalTo(contentView).offset(24)
            make.top.equalTo(websiteLinkTextfield.snp.bottom).offset(12)
        }
    }
    
    private func setupCoffeeChatTextField(){
        coffeeChatTextField.placeholder = "optional"
        coffeeChatTextField.font = .systemFont(ofSize: 14)
        coffeeChatTextField.layer.borderWidth = 0.2
        coffeeChatTextField.layer.borderColor = UIColor.hc.black.cgColor
        coffeeChatTextField.layer.cornerRadius = 10
        coffeeChatTextField.layer.masksToBounds = true
        
        view.addSubview(coffeeChatTextField)
        
        coffeeChatTextField.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.top.equalTo(coffeeChatLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    private func setupDescriptionLabel(){
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = UIColor.hc.black
        descriptionLabel.font = .systemFont(ofSize: 14)
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.top.equalTo(coffeeChatTextField.snp.bottom).offset(12)
        }
    }
    private func setupDescriptionTextField(){
        descriptionTextField.placeholder = "optional"
        descriptionTextField.font = .systemFont(ofSize: 14)
        descriptionTextField.layer.borderWidth = 0.2
        descriptionTextField.layer.borderColor = UIColor.hc.black.cgColor
        descriptionTextField.layer.cornerRadius = 10
        descriptionTextField.layer.masksToBounds = true
        
        view.addSubview(descriptionTextField)
        
        descriptionTextField.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(9)
            make.height.equalTo(33)
            make.width.equalTo(328)
        }
    }
    
    private func setupPostButton(){
        postButton.backgroundColor = UIColor.hc.orangeRed
        postButton.layer.cornerRadius = 20
        postButton.setTitle("-> Post", for: .normal)
        postButton.setTitleColor(UIColor.hc.white, for: .normal)
        postButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        postButton.addTarget(self, action: #selector(postApp), for: .touchUpInside)

        view.addSubview(postButton)
        
        postButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField.snp.bottom).inset(-30)
            make.trailing.equalTo(descriptionTextField)
            make.height.equalTo(39)
            make.width.equalTo(81)
        }
        
    }
    
    
    // select application deadline
    @objc func selectDate(datePicker: UIDatePicker){
        appDeadlineTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    func reverseFormatDate(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter.date(from: string) ?? Date()
    }
    
    //post application
    @objc func postApp(){
        // TODO: Send a POST request to create a post
        let dateText = appDeadlineTextField.text
        let date = reverseFormatDate(string: dateText ?? "")
        
        let month = date.get(.month)
        let year = date.get(.year)
        let day = date.get(.day)
        let hour = date.get(.hour)
        let minute = date.get(.minute)
 
        
        
        NetworkManager.shared.addToClub(category: categoryTextField.text ?? "" , title: "App", club_name: orgNameTextField.text ?? "", description: descriptionTextField.text ?? "", app_link: appLinkTextField.text ?? "", club_link: websiteLinkTextfield.text ?? "", image_link: uploadImageTextField.text ?? "", chat_link: coffeeChatTextField.text ?? "", month: month, day: day, year: year, hour: hour, minute: minute) {[weak self] newClub in
            guard let self = self else {return}
            print("\(newClub.club_name) was successfully added to the feed!")
        }

    }
}


extension PostAppVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = filters[row]
        categoryTextField.resignFirstResponder()
    }
}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
