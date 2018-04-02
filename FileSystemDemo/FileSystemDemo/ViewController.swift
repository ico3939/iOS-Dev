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
        
        // Save and Read Dictionaries
        let monster = NSMutableDictionary()
        monster["name"] = "goblin"
        monster["hp"] = 5
        monster["weapon"] = "Club"
        let dPath = FileManager.filePathInDocumentsDirectory(fileName: "monster.plist")
        monster.write(to: dPath, atomically: true)
        if success {
            print("Wrote \(dPath) to disk")
            // read it back from the disk
            print(NSMutableDictionary(contentsOf: dPath)!)
        } else {
            print("Did not write \(dPath) to disk")
        }
        
        // Test new extensions
        print("---------------")
        print(FileManager.contentsOfDir(url:FileManager.documentsDirectory))
        print(FileManager.fileExistsInDocumentsDirectory(fileName:"playerName2.txt"))
        FileManager.deleteFileInDocumentsDirectory(fileName: "playerName2.txt")
        print(FileManager.contentsOfDir(url:FileManager.documentsDirectory))
        print(FileManager.fileExistsInDocumentsDirectory(fileName:"playerName2.txt"))
        FileManager.deleteFileInDocumentsDirectory(fileName:"bad-file-name.txt")
        
        // Test clearing the documents folder
        FileManager.clearDocumentsFolder()
        print(FileManager.contentsOfDir(url: FileManager.documentsDirectory))
        
        // Test saving images
        print("---------------")
        print("Outside DispatchQueue - Thread.isMainThread=\(Thread.isMainThread)")
        DispatchQueue.main.async {
            print("Inside DispatchQueue - Thread.isMainThread=\(Thread.isMainThread)")
            if let url = URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"){
                let startTime = NSDate().timeIntervalSince1970
                do {
                    let imageData = try Data(contentsOf: url)
                    let image = UIImage(data: imageData)
                    let totalTime = NSDate().timeIntervalSince1970 - startTime
                    print("time to load = \(totalTime) seconds")
                    let url = FileManager.filePathInDocumentsDirectory(fileName: "google.png")
                    image?.saveImageAsPNG(url: url)
                    print("Save image to \(url)")
                } catch {
                    print("ERROR: \(error)")
                    
                }
            }
        }
    }
    
    func savePlayer(playerName: String, path: URL) throws {
        try playerName.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        print("Saved to path: \(path)")
    }

}

