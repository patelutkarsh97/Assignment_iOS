//
//  customTableCell.swift
//  EndGame
//
//  Created by Utkarsh Patel on 23/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class customTableCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
