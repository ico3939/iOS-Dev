//
//  ViewController.swift
//  TableViews
//
//  Created by Student on 2/15/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showColorSegue" {
            let colorsVC = segue.destination.childViewControllers[0] as! ColorsTableVC
            //colorsVC.colors = ["cyan", "magenta", "yellow"]
            colorsVC.title = "Choose a color"
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneTapped" {
            let colorVC = segue.source as! ColorsTableVC
            let color = colorVC.selectedColor
            self.view.backgroundColor = color
        }
    }
}

