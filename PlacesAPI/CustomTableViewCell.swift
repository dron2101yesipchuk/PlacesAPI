//
//  CustomTableViewCell.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restauranName: UILabel!
    @IBOutlet weak var restaurantRating: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
