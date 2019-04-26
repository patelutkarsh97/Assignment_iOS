//
//  CustomSegment.swift
//  EndGame
//
//  Created by Utkarsh Patel on 24/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class CustomSegment: UIView {


    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addMapButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
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
        let nib = UINib(nibName: "CustomSegment", bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            self.addSubview(view)
        }
        
    }
}

