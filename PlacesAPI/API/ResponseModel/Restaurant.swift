//
//  Restaurant.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 11/1/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import Foundation

struct Restaurant: Decodable{
    var name: String?
    var rating: Float?
    var formatted_address: String?
}
