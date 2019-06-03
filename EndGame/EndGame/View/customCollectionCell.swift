//
//  customCollectionCell.swift
//  EndGame
//
//  Created by Utkarsh Patel on 25/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class customCollectionCell: UICollectionViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func fetchImage(image: UIImage) {
        self.image.image = image
        self.activityIndicator.isHidden = true
    }
}
