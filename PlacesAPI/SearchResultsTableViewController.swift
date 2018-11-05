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
        
        self.navigationController?.title = "Restaurants"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        let listNib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(listNib, forCellReuseIdentifier: "restaurantInfoCell")

        if restaurants.count == 0 {
            self.navigationController?.popViewController(animated: true)
            alert()
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "There are no restaurants on this address", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantInfoCell", for: indexPath) as! CustomTableViewCell
        
        cell.restauranName.text = restaurants[indexPath.row].name
        cell.restaurantRating.text = "Rating: " + String(describing: restaurants[indexPath.row].rating!)
        cell.restaurantAddress.text = restaurants[indexPath.row].formatted_address

        return cell
    }
}
