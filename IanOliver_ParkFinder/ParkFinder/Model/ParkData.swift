//
//  ParkData.swift
//  ParkFinder
//
//  Created by Ian Oliver (RIT Student) on 3/26/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

// Singleton class for the park data
public class ParkData {
    static let sharedData = ParkData()
    
    var parks = [StatePark]()
    
    private init() {
        
    }
}
