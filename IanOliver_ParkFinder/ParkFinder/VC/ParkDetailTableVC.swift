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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myNumSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell", for: indexPath)
        
        switch indexPath.section {
        case MySection.title.rawValue:
            // set a bunch of properties for the first section
            cell.textLabel?.text = park?.title
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .left
            
        case MySection.description.rawValue:
            cell.textLabel?.text = park?.description
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textAlignment = .left
            
        case MySection.favorite.rawValue:
            cell.textLabel?.text = "Favorite"
            cell.textLabel?.textColor = view.tintColor
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .center
            
        case MySection.viewOnMap.rawValue:
            cell.textLabel?.text = "View On Map"
            cell.textLabel?.textColor = view.tintColor
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .center
            
        default:
            cell.textLabel?.text = "TBD"
        }
        return cell
    }
    
    override func tableView (_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == MySection.title.rawValue {
            return 54.0
        }
        
        if indexPath.section == MySection.description.rawValue {
            return 120.0
        }
        
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == MySection.favorite.rawValue {
            print("favorite section tapped")
        }
        
        if(indexPath.section == MySection.viewOnMap.rawValue) {
            print("viewOnMap section tapped")
            let data = ["park": park]
            NotificationCenter.default.post(name: showParkNotification, object: self, userInfo: data)
        }
    }
}
