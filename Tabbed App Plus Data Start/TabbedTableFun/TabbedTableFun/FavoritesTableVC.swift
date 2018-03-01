//
//  FavoritesTableVC.swift
//  TabbedTableFun
//
//  Created by jefferson on 3/8/17.
//  Copyright © 2017 Ima Student. All rights reserved.
//

import UIKit

class FavoritesTableVC: UITableViewController {
//   var data = ["Butterflies","Cotton Candy","LOLCats","Lollipops","Love Songs","Puppy Dogs","Rainbows","Smiling Pandas","Sunshine"]
    
    var model: AppData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(model != nil, "Dependency inject model")
        
        title = "Favorites"
        
        // filter the array - "L" words only
        model.data = model.data.filter({$0.hasPrefix("L")})
        
        // the long way to do the same thing
        /*
        data = data.filter({ (element:String) -> Bool in
            return element.hasPrefix("L")
        })
         */
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = model.data[indexPath.row]
        return cell
    }

}
