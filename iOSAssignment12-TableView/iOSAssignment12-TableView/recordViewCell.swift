//
//  recordViewCell.swift
//  iOSAssignment12-TableView
//
//  Created by Utkarsh Patel on 13/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class recordViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
   
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.layer.cornerRadius = (userImageView?.frame.size.width)!/2
        userImageView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
