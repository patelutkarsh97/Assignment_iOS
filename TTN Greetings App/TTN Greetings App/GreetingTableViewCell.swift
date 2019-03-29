//
//  GreetingTableViewCell.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 28/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class GreetingTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
