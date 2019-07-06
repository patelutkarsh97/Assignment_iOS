//
//  RadioCell.swift
//  TataSky-Universal
//
//  Created by Utkarsh Patel on 25/06/19.
//  Copyright © 2019 TTN. All rights reserved.
//

import UIKit

class RadioCell: UITableViewCell {

    @IBOutlet weak var radioImage: UIImageView!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var radioImageWidthConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    func configureCell(itemModel:Item) {
        if itemModel.isSelected {
            self.elementNameLabel.text = itemModel.name
            self.radioImage.image = UIImage(named: "selectedCheckmark")
        }else {
            self.elementNameLabel.text = itemModel.name
            self.radioImage.image = UIImage(named: "checkmark")
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
