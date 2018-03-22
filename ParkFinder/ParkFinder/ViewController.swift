//
//  ViewController.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let park1 = StatePark(name: "Letchworth State Park", latitude: 42.685, longitude: -77.95944)
        
        print(park1)
        
        guard let path = Bundle.main.url(forResource: "parks", withExtension: "json") else {
            print("Eror: could not find path parks.json")
            return
        }
        
//        if let path = Bundle.main.url(forResource: "parks", withExtension: "json") {
        print(path)
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: path)
            let parkList = try decoder.decode(StateParkList.self, from: data)
            print(parkList)
        } catch {
            print("Error: could not initialize JSON data")
        }
        
        
        
        
        
    }
}

