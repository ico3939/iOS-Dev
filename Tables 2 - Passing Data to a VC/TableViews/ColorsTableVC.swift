//
//  TableViewController.swift
//  TableViews
//
//  Created by Student on 2/15/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import UIKit

class ColorsTableVC: UITableViewController {
    
    // Model in ViewController (ideally this is separate)
    var colors = ["red", "green", "blue", "magenta", "cyan", "yellow"]

    override func viewDidLoad() {
        print(#function + "called ")
        //title = "Colors"
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(#function + "called ")
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function + "called ")
        print(#function + " called with numberOfRowsInSection \(section) = \(colors.count)")
        switch (section) {
        case 0:
            return 1
        case 1:
            return colors.count
        default:
            return 0
        }
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        SLOW PERFORMANCE!!
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "HELLO!"
//        return cell
        print(#function + "called ")
        print(#function + " called with indexPath =\(indexPath), the data for this row is = \(colors[indexPath.row])")
        
        var cell = UITableViewCell()
        switch (indexPath.section) {
            
        case 0:
            // Account Cell
            print("Account")
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
            
            cell.textLabel?.text = colors[indexPath.row]
        default:
            print("default")
        }
        
        return cell
    }
    
    @IBAction func cancelTapped(sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
