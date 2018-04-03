//
//  ViewController.swift
//  GitHubProfile
//
//  Created by Student on 4/3/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // guard statements let us avoid Pyramid of doom (nested if statements)
        guard let githubURL = URL(string:"https://api.github.com/users/ico3939")
            else {
            print("Invalid URL")
            return
        }
        print(githubURL)
        
        let task = URLSession.shared.dataTask(with: githubURL) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                print("Invalid reqest, data is nil \(String(describing: error))")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                // try to decode a GitHubProfile struct
                let decoder = JSONDecoder()
                let profile = try decoder.decode(GitHubProfile.self, from: data)
                
                print(profile.name)
                print(profile.location)
                print(profile.avatarUrl)
                
                self.downloadProfilePhoto(url: profile.avatarUrl!)
                
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
        
    }
    
    func downloadProfilePhoto(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("invalid image request data: \(error)")
                return
            }
            
            let image = UIImage.init(data: data)
            
            print(image)
            // display in UI
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }


}

