//
//  CounterBrain.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit

let kNeverModifiedString = "Never"

protocol CounterBrainDelegate {
    func counterBrain(didChange counterBrain: CounterBrain,
                      counter: Int)
}

class CounterBrain {
    private var dataModel: CounterModel
    
    var delegate: CounterBrainDelegate?
    
    var dateString: String {
        get {
            if let dateModified = dataModel.dateModified {
                return dateFormatter.string(from: dateModified)
            } else {
                return kNeverModifiedString
            }
        }
    }
    
    var counter: Int {
        get {
           return dataModel.counter
        }
        set {
            dataModel.counter = newValue
            dataModel.dateModified = Date()
            
            delegate?.counterBrain(didChange: self, counter: newValue)
        }
    }
    
    init(dataModel: CounterModel = CounterModelUserDefaults()) {
        self.dataModel = dataModel
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterBackground(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func applicationWillEnterBackground(_ application: UIApplication) {
        print("Save CounterBrain")
        
        dataModel.save()
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    func increment() {
        counter += 1
        dataModel.save()
    }
    
    func decrement() {
        counter -= 1
        dataModel.save()
    }
    
    func clear() {
        counter = 0
        dataModel.save()
    }
    
}
