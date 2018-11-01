//
//  MainViewController.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func findRestaurants(_ sender: Any) {
        APIManager.sharedInstance.getRestaurants(address: "м.Чернівці, вул. Головна, 220", completionHandler: { (results, error) in
            if error == nil && results != nil {
                let searchResultsViewController = SearchResultsTableViewController()
                searchResultsViewController.restaurants = results?.results as! [Restaurant]
                self.navigationController?.pushViewController(searchResultsViewController, animated: true)
            }
        })
    }
}
