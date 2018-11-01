//
//  MainViewController.swift
//  PlacesAPI
//
//  Created by Andriy Yesipchuk on 10/31/18.
//  Copyright © 2018 Andriy Yesipchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var address: UITextField!
    
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        address.delegate = self
    }
    
    //hiding keyboard on screen tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //hiding keyboard on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func findRestaurants(_ sender: Any) {
        if (address.text?.isEmpty)! {
            alert()
            return
        }
        
        
        APIManager.sharedInstance.getRestaurants(address: address.text!, completionHandler: { (results, error) in
            if error == nil && results != nil {
                self.restaurants.append(contentsOf: results?.results as! [Restaurant])
                if let nextPage = results?.next_page_token {
                    self.getNextRestaurants(nextPageToken: nextPage)
                } else {
                    let searchResultsViewController = SearchResultsTableViewController()
                    searchResultsViewController.restaurants.append(contentsOf: self.restaurants)
                    self.navigationController?.pushViewController(searchResultsViewController, animated: true)
                }
                
            }
        })
    }
    
    func getNextRestaurants(nextPageToken: String){
        APIManager.sharedInstance.getNextRestaurants(next_page_token: nextPageToken, completionHandler: { (results, error) in
            if error == nil && results != nil {
                self.restaurants.append(contentsOf: results?.results as! [Restaurant])
                if let nextPage = results?.next_page_token {
                    self.getNextRestaurants(nextPageToken: nextPage)
                } else {
                    let searchResultsViewController = SearchResultsTableViewController()
                    searchResultsViewController.restaurants.append(contentsOf: self.restaurants)
                    self.navigationController?.pushViewController(searchResultsViewController, animated: true)
                }
                
            }
        })
    }
    
    func alert(){
        let alert = UIAlertController(title: "You didn`t enter the address", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
