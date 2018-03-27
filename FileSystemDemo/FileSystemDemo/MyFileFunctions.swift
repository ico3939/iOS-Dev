//
//  MyFileFunctions.swift
//  FileSystemDemo
//
//  Created by Student on 3/27/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

//func documentsDirectory() -> URL {
//    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
//}
//
//func cachesDirectory() -> URL {
//    return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
//}
//
//func tempDirectory() -> String {
//    return NSTemporaryDirectory()
//}


extension FileManager {
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
    }
    
    static var cachesDirectory: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
    }
    
    static var tempDirectory: String {
        return NSTemporaryDirectory()
    }
    
    static func filePathInDocumentsDirectory(fileName: String)-> URL{
        return FileManager.documentsDirectory.appendingPathExtension(fileName)
    }
}
