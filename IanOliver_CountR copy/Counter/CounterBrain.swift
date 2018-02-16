//
//  CounterBrain.swift
//  Counter
//
//  Created by Student on 2/15/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import Foundation

class CounterBrain {
    var total: Int = 0
    
    func increment() {
        total += 1
    }
    
    func decrement() {
        total -= 1
    }
}
