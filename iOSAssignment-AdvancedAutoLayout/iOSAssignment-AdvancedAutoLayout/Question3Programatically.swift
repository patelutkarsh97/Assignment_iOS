//
//  Question3Programatically.swift
//  iOSAssignment-AdvancedAutoLayout
//
//  Created by Utkarsh Patel on 15/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question3Programatically: UIViewController {

    @IBOutlet weak var verticalStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: verticalStackView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: verticalStackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: verticalStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: verticalStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    
    
    
    
    }
}
