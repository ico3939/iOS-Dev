//
//  ViewController.swift
//  MonsterJson
//
//  Created by Student on 4/3/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let jsonMonster =
        """
        {
        "name": "Smog",
        "hitPoints": 1000,
        }
        """

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bob = Monster(name: "Bob", hitPoints: 37)
        print(bob.description)
        
        let jsonData = jsonMonster.data(using: .utf8)!
        
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: [])
        print(json)
        
        // load from a JSON String
        let decoder = JSONDecoder()
        let monster = try! decoder.decode(Monster.self, from: jsonData)
        print("Monster from JSon: \(monster)")
        
        // Saving to Disk in JSON format
        let encoder = JSONEncoder()
        let monsterData = try! encoder.encode(monster)
        let fileName = "monster.json"
        let url = FileManager.filePathInDocumentsDirectory(fileName: fileName)
        print("url:\(url)")
        print("Saving monster")
        try! monsterData.write(to: url)
        
        // Loading from Disk in JSON format
        print("Loading monster")
        let monsterData2 = try! Data.init(contentsOf: url)
        let monster2 = try! decoder.decode(Monster.self, from: monsterData2)
        print("Loaded monster:", monster2)
    }

}

