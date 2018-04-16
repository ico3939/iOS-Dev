//
//  ViewController.swift
//  iNoying
//
//  Created by Ian Oliver (RIT Student) on 2/12/18.
//  Copyright © 2018 Ian Oliver (RIT Student). All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer = {
        
        let path = Bundle.main.path(forResource: "eatshort1", ofType: "mp3")!
        let url = NSURL(fileURLWithPath: path)
        let p = try! AVAudioPlayer(contentsOf: url as URL)
        p.volume = 0.3
        p.prepareToPlay()
        return p
    }()

    @IBAction func playSound(_ sender: Any) {
        self.player.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

