//
//  SearchResultsTableViewController.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        
        cell.restauranName.text = restaurants[indexPath.row].name
        cell.restaurantRating.text = String(describing: restaurants[indexPath.row].rating!)
        cell.restaurantAddress.text = restaurants[indexPath.row].formatted_address

        return cell
    }
}
