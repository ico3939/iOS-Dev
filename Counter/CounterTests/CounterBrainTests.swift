//
//  CounterBrainTests.swift
//  CounterTests
//
//  Created by Student on 2/15/18.
//  Copyright © 2018 Ian Oliver. All rights reserved.
//

import XCTest

@testable import Counter

class CounterBrainTests: XCTestCase {
    func testCounterBrainStartsAtZero(){
        let counter = CounterBrain()
        
        XCTAssertEqual(counter.total, 0)
    }
    
    func testIncrementAddsOneToTotal(){
        //1. Arrange
        let counter = CounterBrain()
        
        //2. Act
        counter.increment()
        
        //3. Assert
        XCTAssertEqual(counter.total, 1)
    }
   
}
