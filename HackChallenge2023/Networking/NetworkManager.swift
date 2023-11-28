//
//  NetworkManager.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private let endpoint = "http://34.48.50.89/api/"
    
    private init() {
        
    }
    
    //fetch filters
    func fetchCategories(completion: @escaping (Categories) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request("http://34.48.50.89/api/categories/", method: .get)
            .validate()
            .responseDecodable(of: Categories.self, decoder: decoder) { response in
                switch response.result {
                case .success(let categories):
                    completion(categories)
                    
                case .failure(let error):
                    print("Error in NetworkManager.fetchCategories: \(error.localizedDescription)")
                    
                }
            }
    }
    
    //fetch applications
    func fetchClubs(completion: @escaping (Clubs) -> Void) {
        
        let decoder = JSONDecoder()
        
        AF.request("http://34.48.50.89/api/applications/", method: .get)
            .validate()
            .responseDecodable(of: Clubs.self, decoder: decoder) { response in
                switch response.result {
                case .success(let clubs):
                    completion(clubs)
                   
                case .failure(let error):
                    print("Error in NetworkManager.fetchClub: \(error)")

                }
            }
    }
    
    
}
