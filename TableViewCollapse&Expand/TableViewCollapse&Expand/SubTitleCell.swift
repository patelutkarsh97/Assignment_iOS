//
//  subTitleCell.swift
//  TataSky-Universal
//
//  Created by Utkarsh Patel on 25/06/19.
//  Copyright © 2019 TTN. All rights reserved.
//

import UIKit

class SubTitleCell: UITableViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(itemModel:Item) {
            self.subTitleLabel.text = itemModel.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
