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
    
    func addToClub(category: String, title: String, club_name: String, description: String, app_link: String, club_link:String, image_link: String, chat_link: String, month: Int, day: Int, year: Int, hour: Int, minute: Int, completion: @escaping (Club) -> Void) {
        //        let endpoint = "http://34.48.50.89/api/applications/"
        
        let decoder = JSONDecoder()
        //        decoder.dateDecodingStrategy = .iso8601
        
        // encoding into json format
        let parameters: Parameters = [
            "category": "stem",
            "title": "Test application 1",
            "club_name": "fun stuff Club",
            "description": "Recruiting analysts who are passionate about investing. Experience needed",
            "app_link": "https://www.cornellmicc.com/recruitment",
            "club_link": "https://www.cornellmicc.com/",
            "image_link":"https://media.licdn.com/dms/image/C560BAQF6BdkkywgBhQ/company-logo_200_200/0/1631391332655?e=2147483647&v=beta&t=tqHePxQsTKsPVgSW7OtZV3oaMSt586YT4QyEVjp32zU",
            "chat_link": "https://docs.google.com/forms/d/e/1FAIpQLSfyUQOLjgjMJwu29Ae530wo7tsPGKl0ZEjhRcuY_1ZcMYRqPw/closedform",
            "month": 2,
            "day": 1,
            "year": 2023,
            "hour": 23,
            "minute": 9
        ]
        
        AF.request("http://34.48.50.89/api/applications/", method: .post, parameters: parameters)
            .responseDecodable(of: Club.self, decoder: decoder) { response in
                switch response.result{
                case .success(let newClub):
                    print("Successfully added to clubs \(newClub.club_name)")
                    completion(newClub)
                case .failure(let error):
                    print("Error in NetworkManager.addToClub: \(error)")
                }
            }
        
    }
}
