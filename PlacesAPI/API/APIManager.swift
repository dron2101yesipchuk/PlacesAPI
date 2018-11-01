//
//  APIManager.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    let API_KEY = "AIzaSyD4huuD6alciZiZieoytqlZemCqjtXlYAY"
    let baseURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+"
    
    static let sharedInstance = APIManager()
    var manager: SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
}
