//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by ac on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class TriviaTableViewController: UITableViewController /*, UIAccessibilityIdentification*/ {
    
    var location = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessibilityLabel = "Trivia Table"
        //accessibilityIdentifier = "Trivia Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        cell.textLabel?.text = location.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(location.trivia[indexPath.row].likes)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let cellTapped = self.tableView.indexPathForSelectedRow
        let destVC = segue.destination as? AddTriviaViewController
        destVC?.location = self.location
    }
    
}
