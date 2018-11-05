//
//  APIManager.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    let API_KEY = "AIzaSyD4huuD6alciZiZieoytqlZemCqjtXlYAY"
    let baseURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
    
    static let sharedInstance = APIManager()
    
    //getting restaurants(maximum 20)
    func getRestaurants(address: String, completionHandler: @escaping (Result?, Error?) -> ()) {
        
        let newAddress = address.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let URL = "\(baseURL)query=restaurants+in+\(newAddress)&key=\(API_KEY)"
        
        Alamofire.request(URL).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let responseObject = try JSONDecoder().decode(Result.self, from: response.data!)
                    completionHandler(responseObject, nil)
                } catch let err{
                    print(err)
                }
        
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    //if there are more than 20 restaurants, getting next 20 restaurants with next_page_token
    func getNextRestaurants(next_page_token: String, completionHandler: @escaping (Result?, Error?) -> ()) {
        
        let URL = "\(baseURL)pagetoken=\(next_page_token)&key=\(API_KEY)"
        
        Alamofire.request(URL).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let responseObject = try JSONDecoder().decode(Result.self, from: response.data!)
                    completionHandler(responseObject, nil)
                } catch let err{
                    print(err)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
