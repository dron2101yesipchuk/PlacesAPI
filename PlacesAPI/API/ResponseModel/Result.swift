//
//  Result.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 11/1/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import Foundation

struct Result: Decodable{
    var status: String?
    var next_page_token: String?
    var results: [Restaurant?]
}
