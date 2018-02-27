//
//  CounterModel.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import Foundation

protocol CounterModel {
    var counter: Int { get set }
    var dateModified: Date? { get set }
    
    func save()
    func load()
}

// Objective-C naming convention for constants (start with k)
let kCounterKey = "kCounterKey"
let kDateKey = "kDateKey"

// Swift constants
struct Constants {
    struct CounterModel {
        static let defaultDate: Date? = nil
        static let defaultCounter: Int = 0
    }
}

class CounterModelUserDefaults: CounterModel {
    let defaults: UserDefaults
    
    var counter: Int
    var dateModified: Date?
    
    // Initializer Dependency Injection with a default value
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        defaults = userDefaults
        counter = Constants.CounterModel.defaultCounter
        dateModified = Constants.CounterModel.defaultDate
        
        load()
    }
    
    func save() {
        defaults.set(counter, forKey: kCounterKey)
        defaults.set(dateModified, forKey: kDateKey)
        // Don't do on iOS 8+
        // defaults.synchronize()
    }
    
    func load() {
        // NOTE: defaults.integer(forKey: ) will default to 0 if key is missing
        if let counter = defaults.value(forKey: kCounterKey) as? Int {
            self.counter = counter
        } else {
            self.counter = Constants.CounterModel.defaultCounter
        }
        
        if let date = defaults.value(forKey: kDateKey) as? Date {
            self.dateModified = date
        } else {
            self.dateModified = Constants.CounterModel.defaultDate
        }
        
    }
    
    
    
    
    
}






