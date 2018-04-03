//
//  AddBookmarksVC.swift
//  Bookmarker
//
//  Created by Ian Oliver (RIT Student) on 4/2/18.
//  Copyright © 2018 tony. All rights reserved.
//

import UIKit

class AddBookmarksVC: UIViewController {
    
    // ivars
    var bookmark:Bookmark?
    @IBOutlet weak var titleField:UITextField!
    @IBOutlet weak var urlField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Bookmark"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = (titleField.text?.characters.count)! > 0 ? titleField.text! : "No title entered"
        let url = (urlField.text?.characters.count)! > 0 ? urlField.text! : "No URL entered"
        
        bookmark = Bookmark(name: name, url: url)
    }

}
