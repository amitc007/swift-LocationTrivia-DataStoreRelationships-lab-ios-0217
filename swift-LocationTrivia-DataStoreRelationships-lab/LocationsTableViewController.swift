//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by ac on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class LocationsTableViewController : UITableViewController /*, UIAccessibilityIdentification*/ {
    var store =  LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.accessibilityLabel = "Locations Table"
        //self.accessibilityIdentifier = "Locations Table"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = store.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(store.locations[indexPath.row].trivia.count)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("In prepare for triviaTableSegue")
        if segue.identifier != "triviaTableSegue" {  return  }
        print("After if in prepare for triviaTableSegue")
        let cellTapped = tableView.indexPathForSelectedRow
        let destVC = segue.destination as? TriviaTableViewController
        destVC?.location = store.locations[(cellTapped?.row)!]
        
    }
    
}
