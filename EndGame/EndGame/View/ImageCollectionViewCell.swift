//
//  ImageCollectionViewCell.swift
//  EndGame
//
//  Created by Utkarsh Patel on 29/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func fetchImage(image: UIImage) {
        self.imageView.image = image
        self.activityIndicator.isHidden = true
    }

}

