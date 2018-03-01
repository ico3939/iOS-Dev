//
//  ViewController.swift
//  NoStoryboards
//
//  Created by Student on 2/27/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model: SimpleModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(model != nil, "Use dependency injection to seet up model")
        
        print(#function)
        view.backgroundColor = .red
    }

}

