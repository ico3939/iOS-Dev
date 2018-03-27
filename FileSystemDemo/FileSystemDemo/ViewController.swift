//
//  ViewController.swift
//  FileSystemDemo
//
//  Created by Student on 3/27/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Documents \n\t \(FileManager.documentsDirectory)")
        
        print("Documents \n\t \(FileManager.cachesDirectory)")
        
        print("Temp \n\t \(FileManager.tempDirectory)")
    
        
        let fileName = "playName"
        let playName = "Xander"
        let path = FileManager.documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
        do {
            try savePlayer(playerName: playName, path: path)
            
        } catch {   // error
            print("Error failed to save to path: \(path) Error:: \(error)")
        }
        
        let playerName2 = "Dan"
        let path2 = FileManager.filePathInDocumentsDirectory(fileName: "playerName2.txt")
        do {
            try savePlayer(playerName: playerName2, path: path2)
        } catch {
            print("Unable to save player at path: \(path2),\(error)")
        }
        
        let playerName3 = "Buffy"
        let path3 = FileManager.filePathInDocumentsDirectory(fileName: "playerName3.txt")
        try! playerName3.write(to: path3, atomically: true, encoding: String.Encoding.utf8)
        
        let array = NSMutableArray()
        array.addObjects(from: ["red", "green", "blue"])
        let arrayPath = FileManager.filePathInDocumentsDirectory(fileName: "colors.plist")
        let success = array.write(to: arrayPath, atomically: true)
        if success {
            print("Wrote \(arrayPath) to disk")
            // read it back from the disk
            print(NSMutableArray(contentsOf:arrayPath)!)
        } else {
            print("Did not write \(arrayPath) to disk")
        }
    }
    
    func savePlayer(playerName: String, path: URL) throws {
        try playerName.write(to: path, atomically: true, encoding: .utf8)
        print("Saved to path: \(path)")
    }

}

