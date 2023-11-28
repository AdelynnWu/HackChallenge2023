//
//  Category.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation

struct Category: Codable {
    let id: Int
    let name: String
}

struct Categories: Codable {
    let categories: [Category]
}
