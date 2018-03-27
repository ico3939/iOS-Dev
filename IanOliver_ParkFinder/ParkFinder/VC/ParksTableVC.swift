//
//  ParksTableVC.swift
//  ParkFinder
//
//  Created by Ian Oliver (RIT Student) on 3/26/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit

class ParksTableVC: UITableViewController {
    
    var parks = [StatePark]()
    
    override func viewDidLoad() {
        parks = ParkData.sharedData.parks
        
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(#function + "called ")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function + "called ")
        print(#function + " called with numberOfRowsInSection \(section) = \(parks.count)")
        switch (section) {
        case 0:
            return parks.count
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function + "called ")
        print(#function + " called with indexPath =\(indexPath), the data for this row is = \(parks[indexPath.row])")
        
        var cell = UITableViewCell()
        switch (indexPath.section) {
            
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "ParkCell", for: indexPath)
            
            cell.textLabel?.text = parks[indexPath.row].title
        default:
            print("default")
        }
        
        return cell
    }
}
