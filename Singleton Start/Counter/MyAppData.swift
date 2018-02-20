//
//  MyAppData.swift
//  Counter
//
//  Created by Student on 2/20/18.
//  Copyright © 2018 tony. All rights reserved.
//

import Foundation

protocol DataSave {
    
    var dateString: String { get }
    var count: Int { get }
    
//    func saveDate(dataString: String)
//    func saveCount(count: Int)
    
    func readDefaultsData()
    func saveDefaultsData()
}

// Save to NSUserDefaults
// Save to CoreData
// Save to Server


let counterKey = "counterKey"
let dateStringKey = "DateStringKey"

class DataSaveUserDefaults: DataSave {// conforms to the DataSave delegate
    
    var dateString: String {
        didSet {
            saveDefaultsData()
        }
    }
    
    var count: Int {
        didSet {
            saveDefaultsData()
        }
    }
    
    func saveDefaultsData() {
        UserDefaults.standard.set(forKey: counterKey)
    }
    
    func readDefaultsData() {
        // FIXME: will return 0 if no key exists
        count = UserDefaults.standard.integer(forKey: counterKey)
        
        if let dateString = UserDefaults.standard.integer(forKey: counterKey) {
            self.dateString = dateString
        }
        else {
            self.dateString = "Last Saved: never"
        }
    }
    
//    func saveDate(dataString: String) {
//        // TODO:
//    }
//
//    func saveCount(count: Int) {
//        // TODO:
//    }
}

class MyAppData {
    static var shared = MyAppData(dataSave: DataSaveUserDefaults()) // Singleton instance
    
    var counterTotal = 0
    var dateString = "Last used: never"
    var dataSave: DataSave
    
    // Dependency injection
    // Composition
    init(dataSave: DataSave) {
        self.dataSave = dataSave
        print("created instance")
    }
}
