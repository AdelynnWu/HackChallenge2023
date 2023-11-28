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
                    print(categories)
                case .failure(let error):
                    print("Error in NetworkManager.fetchCategories: \(error.localizedDescription)")
                    
                }
            }
    }
    
    //fetch applications
    func fetchClubs(completion: @escaping ([Club]) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(endpoint+"applications/", method: .get)
            .validate()
            .responseDecodable(of: [Club].self, decoder: decoder) { response in
                switch response.result {
                case .success(let club):
                    completion(club)
                case .failure(let error):
                    print("Error in NetworkManager.fetchClub: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
    
    
}
