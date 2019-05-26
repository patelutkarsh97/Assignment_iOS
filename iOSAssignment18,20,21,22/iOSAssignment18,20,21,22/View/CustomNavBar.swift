//
//  CustomNavBar.swift
//  iOSAssignment18,20,21,22
//
//  Created by Utkarsh Patel on 12/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class CustomNavBar: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerNib()
    }
    
    private func registerNib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavBar", bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            self.addSubview(view)
        }
    }
}
