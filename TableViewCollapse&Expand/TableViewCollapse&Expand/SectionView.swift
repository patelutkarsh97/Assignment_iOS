//
//  SectionView.swift
//  TataSky-Universal
//
//  Created by Utkarsh Patel on 25/06/19.
//  Copyright © 2019 TTN. All rights reserved.
//

import UIKit
protocol CollapsibleSectionDelegate {
    func toggleSection( section: Int)
}

class SectionView: UIView {
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var sideSelectionImageForiPad: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    var delegate: CollapsibleSectionDelegate?
    var section: Int = 0
    @IBOutlet weak var topSeparationLine: UIView!
    @IBOutlet weak var sectionButton: UIButton!
    @IBAction func onTapSection(_ sender: Any) {
        if let sectionButton = sender as? UIButton {
            delegate?.toggleSection(section: sectionButton.tag)
        }
    }
    
    open func rotate180() {
        UIView.animate(withDuration: 0.4, animations: {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
        })
    }
    open func rotate360() {
        UIView.animate(withDuration: 0.4, animations: {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
        })
    }
}

