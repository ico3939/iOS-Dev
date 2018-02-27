//
//  ViewController.swift
//  UserDefaults
//
//  Created by Ian Oliver on 2/26/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // properties
    var counterBrain: CounterBrain!

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(counterBrain != nil, "CounterBrain mut be set before using property via dependecy injection")
 
        updateDisplay()
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        counterBrain.decrement()
        updateDisplay()
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        counterBrain.increment()
        updateDisplay()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        counterBrain.clear()
        updateDisplay()
    }
    
    func updateDisplay() {
        counterLabel.text = "\(counterBrain.counter)"
        dateLabel.text = counterBrain.dateString

    }
    @IBAction func share(_ sender: Any) {
        let textToShare = "I just used Counter! \n\(dateLabel.text!)\nMyTotal is \(counterLabel.text!)!\n"
        let igmWebsite = NSURL(string: "http://igm.rit.edu/")
        let objectToShare:[Any] = [textToShare as Any, igmWebsite!]
        let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }
}




