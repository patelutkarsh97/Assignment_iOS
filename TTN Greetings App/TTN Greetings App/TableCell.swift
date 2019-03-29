//
//  TableCell.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 22/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    var userData: UserAccount? {
        didSet {
            nameLabel.text = userData?.name
            dobLabel.text = userData?.dob
            if userData != nil {
                 let phoneString = String(userData!.phone)
                phoneLabel.text = phoneString
            }
            emailLabel.text = userData?.email
        }
    }
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.imageBorder()
        userImageView.imageRound()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

protocol ImageFormatting
{
    func imageRound()
    func imageBorder()
}

extension UIImageView : ImageFormatting
{
    func imageRound() {
        self.layer.cornerRadius = CGFloat(self.frame.size.width/2)
    }
    func imageBorder() {
        self.layer.borderWidth = 5.0
    }
}
