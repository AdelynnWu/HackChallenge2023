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
    
    func addToClub(newClub: Club, completion: @escaping (Bool) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // encoding into json format
        let message: Parameters = [
            "message": message
        ]
        
        AF.request(endpoint+"/api/posts/create/", method: .post, parameters: message)
            .validate()
            .responseDecodable(of: Club.self, decoder: decoder) { response in
                switch response.result{
                case .success:
                    print("Successfully added to clubs")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.addToPost: \(error.localizedDescription)")
                    completion(false)
                }
            }
        
    }
}
