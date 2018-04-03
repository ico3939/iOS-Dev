//
//  Github Profile.swift
//  GitHubProfile
//
//  Created by Student on 4/3/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit

struct GitHubProfile: Codable {
    let name: String?
    let location: String?
    let avatarUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case name
        case location
        case avatarUrl = "avatar_url"
    }
}
