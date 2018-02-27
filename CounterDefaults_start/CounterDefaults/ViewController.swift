//
//  ViewController.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var counterBrain: CounterBrain!
    var counterTimer: Timer?
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func stopTimer() {
        counterTimer?.invalidate()
        counterTimer = nil
    }
    
    fileprivate func createTimer() {
        stopTimer()
        
        counterTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            self.counterBrain.increment()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        counterBrain = nil    // Test the assertion logic
        assert(counterBrain != nil, "CounterBrain must be set before using property via dependency injection")
        
        createTimer()
        updateDisplay()
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(_:)), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterBackground(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func applicationWillEnterForeground(_ application: UIApplication) {
        print("ViewController" + #function)
        
        createTimer()
    }
    
    @objc func applicationWillEnterBackground(_ application: UIApplication) {
        print("ViewController" + #function)
        
        stopTimer()
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
}

// Delegate allows us to send a message to update
extension ViewController: CounterBrainDelegate {
    func counterBrain(didChange counterBrain: CounterBrain, counter: Int) {
        print("New value: \(counterBrain.counter)")
        updateDisplay()
    }
}




