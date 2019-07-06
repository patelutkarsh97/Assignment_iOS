//
//  SwitchCell.swift
//  TataSky-Universal
//
//  Created by Utkarsh Patel on 25/06/19.
//  Copyright © 2019 TTN. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {

    @IBOutlet weak var titleLabelForSwitch: UILabel!
    @IBOutlet weak var controlSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(itemModel:Item) {
        self.titleLabelForSwitch.text = itemModel.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
