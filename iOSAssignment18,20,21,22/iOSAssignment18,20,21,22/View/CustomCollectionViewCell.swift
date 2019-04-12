//
//  CustomCollectionViewCell.swift
//  iOSAssignment18,20,21,22
//
//  Created by Utkarsh Patel on 12/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fetchImage(image: UIImage) {
        self.imageView.image = image
        self.activityIndicator.isHidden = true
    }
    
    func fetchAuthor(authorName: String) {
        self.loadingLabel.text = authorName
    }
    
}
