//
//  StackTableViewCell.swift
//  testing
//
//  Created by Utkarsh Patel on 20/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class StackTableViewCell: UITableViewCell {

    @IBOutlet weak var compressHorizontalStackView: UIStackView!
    @IBOutlet weak var compressStackHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        compressStackHeight.constant = 0.0
        compressHorizontalStackView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let constant: CGFloat = selected ? 128.0 : 0.0
        print("Setting constant to \(constant)  select : \(selected)- Animated: \(animated)")
        
        if !animated {
            compressStackHeight.constant = constant
            compressHorizontalStackView.isHidden = !selected
            
            return
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.compressStackHeight.constant = constant
            self.layoutIfNeeded()
        }, completion: { completed in
            self.compressHorizontalStackView.isHidden = !selected
        })
        
        
    }
    
}
