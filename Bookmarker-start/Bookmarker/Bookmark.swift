//
//  Bookmark.swift
//  Bookmarker
//
//  Created by jefferson on 10/23/16.
//  Copyright © 2016 tony. All rights reserved.
//

import Foundation
class Bookmark: NSObject, NSCoding {
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(url, forKey: "url")
        print("encode with coder called on \(name)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        url = aDecoder.decodeObject(forKey: "url") as! String
        print("init with coder called on \(name)")
    }
    
    var name:String
    var url: String
    
    init(name:String,url:String){
        self.name = name
        self.url = url
    }
}
