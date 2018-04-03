//
//  Monster.swift
//  MonsterJson
//
//  Created by Student on 4/3/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Monster: CustomStringConvertible, Codable {
    var name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
    
    var description: String {
        return "\(name): hitPoints = \(hitPoints)"
    }

}
