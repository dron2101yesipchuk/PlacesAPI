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
    
    func getRestaurants(address: String, completionHandler: @escaping (Result?, Error?) -> ()) {
        
        let newAddress = address.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let URL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+\(newAddress)&key=\(API_KEY)"
        
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
