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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // guard statements let us avoid Pyramid of doom (nested if statements)
        
    }
    
    func downloadProfilePhoto(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("invalid image request data: \(String(describing: error))")
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
    
    func updateUI(profile: GitHubProfile) {
        print(profile.name)
        print(profile.location)
        print(profile.avatarUrl)
        self.downloadProfilePhoto(url: profile.avatarUrl!)
        
        DispatchQueue.main.async {
            self.nameLabel.text = profile.name
            self.locationLabel.text = profile.location
        }
        
    }
    
    func searchForUser(username: String) {
        guard let githubURL = URL(string:"https://api.github.com/users/\(username)")
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
                
                self.updateUI(profile: profile)
                
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
        
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchForUser(username: usernameTextField.text!)
    }


}

