//
//  ViewController.swift
//  Counter
//
//  Created by Student on 2/15/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ivar
    var total: Int = 0
    
    // Outlets
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        total = 0
        displayTotal()
    }
    
    //IBActions
    @IBAction func minusButtonPressed(_ sender: Any) {
        total -= 1
        if(total < 0) {
            total = 0
        }
        displayTotal()
    }
    
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        
        total = 0
        displayTotal()
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        total += 1
        displayTotal()
        
    }
    
    // Helper Function
    private func displayTotal() {
        counterLabel.text = String(total)
    }
    
}

