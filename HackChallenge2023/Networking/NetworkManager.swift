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
    
    func addToClub(category: String, title: String, club_name: String, description: String, app_link: String, club_link:String, image_link: String, second_image_link: String, chat_link: String, month: Int, day: Int, year: Int, hour: Int, minute: Int, completion: @escaping (Club) -> Void) {
        //        let endpoint = "http://34.48.50.89/api/applications/"
        
        let decoder = JSONDecoder()
        //        decoder.dateDecodingStrategy = .iso8601
        
        // encoding into json format
        let parameters: Parameters = [
            "category": category,
            "title": title,
            "club_name": club_name,
            "description": description,
            "app_link": app_link,
            "club_link": club_link,
            "image_link": image_link,
            "second_image_link":second_image_link,
            "chat_link": chat_link,
            "month": month,
            "day": day,
            "year": year,
            "hour": hour,
            "minute": minute
            
//            "category": category,
//            "title": "Test application 1",
 //           "club_name": "AppDev",
 //           "description": "Recruiting designer, iOS, Android, and backend. Experience preferred but not required.",
  //          "app_link": "https://www.cornellappdev.com/apply",
 //           "club_link": "https://www.cornellappdev.com/team",
  //          "image_link": "https://media.licdn.com/dms/image/C4D0BAQFgEIOD0w6BAg/company-logo_200_200/0/1630519709031/cornell_app_development_cuappdev__logo?e=2147483647&v=beta&t=X2ZrPgxbvJFJb8AnrR6dymg_5v4r2vmys4vqoLP4AKo",
   //         "second_image_link": "https://i1.wp.com/cornellsun.com/wp-content/uploads/2023/10/Eatery-courtesy-of-Iskander-Khan.jpg?fit=1170%2C779&ssl=1",
       //     "chat_link": "https://calendly.com/exh2/30min",
    //        "month": 1,
    //        "day": 1,
    //        "year": 2023,
    //        "hour": 23,
     //       "minute": 59
        ]
        
        AF.request("http://34.48.50.89/api/applications/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
