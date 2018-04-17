//
//  ViewController.swift
//  FacebookTableViewCell
//
//  Created by Paul Solt on 2/15/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var facebookTableView: UITableView!
    
    var textArray: [String] =
        [
            """
    This weekend I was craving 100% whole wheat artisan bread using local ingredients!\n
    I set out to try the Tartine method and had phenomenal results after I rushed my previous bread/pizza batch the week before.\n
    Today I learned from my previous mistakes, and while I still failed to make it perfect, I was encouraged by the huge leap in improvement!\n
    I didn’t realize how important scoring the loaf was to get the oven spring to really open it up.\n
    This time I planned a bit better, which you can see on my recipe cards attached ... used a 85% hydration with local flour from Farmer Ground and a yeast culture that I’ve been feeding for months.\n
    #bread #artisanbread #homemade #dutchoven @farmergroundflour @tartinebakery @tartinebaker #plantbased #wholegrain @restaurantfiorella @food.mike\n
    @ West Henrietta, New York
    """,
            "Be a yardstick of quality. Some people aren't used to an environment where excellence is expected. - Steve Jobs",
            "Innovation distinguishes between a leader and a follower. - Steve Jobs",
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookTableView.dataSource = self
        facebookTableView.estimatedRowHeight = 400
        facebookTableView.rowHeight = UITableViewAutomaticDimension
        
        let nibName = UINib(nibName: "FacebookCell", bundle:nil)
        facebookTableView.register(nibName, forCellReuseIdentifier: "FacebookCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacebookCell", for: indexPath) as! FacebookCell
        cell.messageLabel.text = textArray[indexPath.row]
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: FacebookCellDelegate {

    func facebookCellMoreButtonPressed(cell: FacebookCell) {
        print("Cell pressed: \(cell)")
    }
}
