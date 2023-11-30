//
//  Club.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation

struct Club: Codable {
    
    let id: Int
    let category: Category
    let title: String
    let club_name: String
    let description: String
    let app_link: String
    let club_link: String
    let image_link: String
    let chat_link: String
    let minute: Int
    let hour: Int
    let month: Int
    let day: Int
    let year: Int
    
//    let deadline: String
//    var imageUrl: String
}

struct Clubs: Codable {
    let applications: [Club]
}
