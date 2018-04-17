//
//  FacebookCell.swift
//  FacebookTableViewCell
//
//  Created by Student on 4/17/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit

// Delegate Protocol to communicate
protocol FacebookCellDelegate {
    
    // standard delegate naming convention
    func facebookCellMoreButtonPressed(cell: FacebookCell)
}

class FacebookCell: UITableViewCell {
    
    var delegate: FacebookCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var profleImageView: UIImageView!
    @IBAction func moreButtonPressed(_ sender: Any) {
        print("More")
        
        delegate?.facebookCellMoreButtonPressed(cell: self)
    }
}
