//
//  LabelCell.swift
//  TableViewCollapse&Expand
//
//  Created by Utkarsh Patel on 27/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {

    @IBOutlet weak var elementNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(itemModel:Item) {
        self.elementNameLabel.text = itemModel.name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
