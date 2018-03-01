//
//  AppData.swift
//  TabbedTableFun
//
//  Created by Student on 3/1/18.
//  Copyright © 2018 Ima Student. All rights reserved.
//

import Foundation

class AppData {
    
    var data = ["Butterflies","Cotton Candy","LOLCats","Lollipops","Love Songs","Puppy Dogs","Rainbows","Smiling Pandas","Sunshine"]
    
    private var data2 = ["colors": ["red", "green", "blue", "orange"],
                         "monsters": ["Orc", "Kirin", "Gray Ooze", "Zombie"],
                         "heroes": ["Gilgamesh", "King Arthur", "Roland", "Aragorn"]]
    
    func fetchAll(category: String) -> [String] {
        // ?? = nul coelescing operator
        return data2[category] ?? [String]()
    }
    
}
