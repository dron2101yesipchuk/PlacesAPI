//
//  MainViewController.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func findRestaurants(_ sender: Any) {
        let searchResultsViewControllers = SearchResultsTableViewController()
        self.navigationController?.pushViewController(searchResultsViewControllers, animated: true)
    }
}
