//
//  ParkDetailTableVC.swift
//  ParkFinder
//
//  Created by Student on 4/2/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ParkDetailTableVC: UITableViewController {
    var park:StatePark?
    let myNumSections = 4
    enum MySection: Int {
        case title = 0, description, favorite, viewOnMap
    }
    
    override func viewDidLoad() {
        title = park?.title
        
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell", for: indexPath)
        
        if indexPath.section == MySection.title.rawValue {
            // set a bunch of properties for the first section
            cell.textLabel?.text = park?.title
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .left
        } else {
            cell.textLabel?.text = "TBD"
        }
        
        return cell
    }
}
